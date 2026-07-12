#{ lib, ... }:
#lib.nixvim.plugins.mkNeovimPlugin {
#  name = "my-plugin";
#  moduleName = "my-plugin"; # TODO replace (or remove entirely if it is the same as `name`)
#  package = "my-plugin-nvim"; # TODO replace
#
#  # TODO replace with your name
#  maintainers = [ lib.maintainers.MyName ];
#
#  # TODO provide an example for the `settings` option (or remove entirely if there is no useful example)
#  # NOTE you can use `lib.literalExpression` or `lib.literalMD` if needed
#  settingsExample = {
#    foo = 42;
#    bar.__raw = "function() print('hello') end";
#  };
#}
{ pkgs ? import <nixpkgs> {} }:                      
                                                     
pkgs.stdenv.mkDerivation {                           
  pname = "myplugin";                              
  version = "1.0";                                 
                                                     
  src = ./.;  # Use current directory as source      
                                                     
  buildInputs = [ pkgs.lua ];                        
                                                     
  installPhase = ''                                  
    mkdir -p $out/share/nvim/lua/plugins/nixvim_binary_runner
    cp -r lua/* $out/share/nvim/lua/plugins/nixvim_binary_runner/
  '';                                                
}                                                    
