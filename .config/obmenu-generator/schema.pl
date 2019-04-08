#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu          {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu       {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator            {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                    {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file   {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox    {raw => q(xml data)},
    begin_cat: beginning of a category              {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                    {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                {exit => ["label", "icon"]},

=cut

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
    # Format:  NAME, LABEL, ICON
    {sep => "im existing"},
    {item => ['exo-open --launch TerminalEmulator', 'Terminal', 'terminal-emulator']},
    {item => ['exo-open --launch WebBrowser ', 'Web Browser', 'web-browser']},
    {item => ['exo-open --launch FileManager', 'File Manager', 'file-manager']},
    {item => ['exo-open --launch MailReader', 'Mail Reader', 'mail-reader']},
    {sep => undef},
    {cat => ['utility', 'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education', 'Education', 'applications-science']},
    {cat => ['game', 'Games', 'applications-games']},
    {cat => ['graphics', 'Graphics', 'applications-graphics']},
    {cat => ['audiovideo', 'Multimedia', 'applications-multimedia']},
    {cat => ['network', 'Network', 'applications-internet']},
    {cat => ['office', 'Office', 'applications-office']},
    {cat => ['other', 'Other', 'applications-other']},
    {cat => ['settings', 'Settings', 'gnome-settings']},
    {cat => ['system', 'System', 'applications-system']},
    {sep => undef},
    {pipe => ['manjaro-places-pipemenu --recent ~/', 'Places', 'folder']},
    {sep => undef},
    {begin_cat => ['Preferences', 'theme']},
      {begin_cat => ['Openbox', 'openbox']},
        {item => ['obconf', 'Openbox Configuration', 'theme']},
        {item => ['kickshaw', 'GUI Menu Editor', 'openbox']},
        {item => ['obkey', 'GUI Keybind Editor', 'openbox']},
        {item => ['ob-autostart', 'GUI Autostart Editor', 'openbox']},
        {sep => undef},
        {item => ["exo-open ~/.config/openbox/menu.xml", 'Edit menu.xml', 'text-xml']},
        {item => ["exo-open ~/.config/openbox/rc.xml", 'Edit rc.xml', 'text-xml']},
        {item => ["exo-open ~/.config/openbox/autostart", 'Edit autostart', 'text-xml']},
        {sep => undef},
        {item => ['openbox --restart', 'Openbox Restart', 'openbox']},
        {item => ['openbox --reconfigure', 'Openbox Reconfigure', 'openbox']},
      {end_cat => undef},
      {pipe => ['manjaro-polybar-pipemenu', 'Polybar', 'polybar']},
      {pipe => ['manjaro-conky-pipemenu', 'Conky', 'conky']},
      {pipe => ['manjaro-tint2-pipemenu', 'Tint2', 'tint2']},
      {pipe => ['manjaro-compositor', 'Compositor', 'compton']},
      {begin_cat => ['System', 'system-settings']},
        {item => ['lxappearance', 'Customize Look and Feel', 'theme']},
        {item => ['xfce4-appearance-settings', 'Apperance', 'theme']},
        {item => ['pavucontrol', 'Audio Settings', 'multimedia-volume-control']},
        {item => ['pamac-manager', 'Add/Remove Software', 'pamac-manager']},
        {item => ['arandr', 'Screen Layout', 'xfce4-display-settings']},
        {item => ['xfce4-settings-manager', 'Settings Manager', 'xfce4-settings-manager']},        
      {end_cat => undef},
      {sep => undef},
      {item => ['nitrogen', 'Change Wallpaper', 'nitrogen']},
      {item => ['rofi-theme-selector', 'Rofi Theme', 'theme']},
      {item => ['manjaro-panel-chooser', 'Panel Chooser', 'panel']},
    {end_cat => undef},
    {sep => undef},
    {begin_cat => ['Menu Generator', 'menu-editor']},
      {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Layout', 'text-x-source']},
      {sep  => undef},
      {item => ['obmenu-generator -p', 'Generate a pipe menu', 'menu-editor']},
      {item => ['obmenu-generator -s -c', 'Generate a static menu', 'menu-editor']},
    {end_cat => undef},
    {item => ['switchmenu --static', 'Switch Menu', 'menu-editor']},
    {pipe => ['manjaro-kb-pipemenu', 'Display Keybinds', 'cs-keyboard']},
    {pipe => ['manjaro-help-pipemenu', 'Help and Info', 'info']},
    {sep => undef},
    {item => ['lockscreen -- scrot', 'Lock Screen', 'lock']},
    {item => ['rofr.sh -l', 'Exit Openbox', 'exit']},
    ]
