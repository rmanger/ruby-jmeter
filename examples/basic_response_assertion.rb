$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruby-jmeter'

test do
  threads count: 2 do
    transaction name: 'Assertions' do
      visit name: 'Altentee', url: 'http://altentee.com/' do
        response_assertion contains: 'We test, tune and secure your site'
        response_assertion 'not-contains' => 'Something in frames', scope: 'children'
      end
    end
  end
end.run(path: '/usr/share/jmeter-2.13/bin/', gui: true)