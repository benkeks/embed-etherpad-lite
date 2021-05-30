# name: embed-etherpad-lite
# about: Embed Etherpad Lite pads using Onebox.
# version: 1.0
# authors: Bernhard Fürst
# url: https://github.com/fuerst/embed-etherpad-lite

require 'onebox'

module Onebox
  module Engine
    class EtherpadLiteOnebox
      include Engine
      
      always_https
      
      # Try to guess Etherpad Lite links like http(s)://domain.tld:port/p/pad-id
      matches_regexp /\/p\/[^\/]+$/

      # See https://github.com/ether/etherpad-lite/wiki/Embed-Parameters
      def to_html
        "<iframe name='embed_readwrite' src='#{@url}?showControls=true&showChat=true&showLineNumbers=true&useMonospaceFont=false' class='etherpad' style='border-width:0' frameborder='0' scrolling='no' width='100%' height=600></iframe><br><a href='#{@url}' target='_blank'>Goto this EtherPad</a>"
      end
end
