require 'sinatra'
require 'google_weather'

def determine_weather(location)
	client = GoogleWeather::Client.new
	weather = client.lookup_by_location(location).condition['text']
	return weather.downcase
end

post '/weather' do
	post = params[:post]['location']
	@weather = get_weather(post)

"#{@weather}"

		if (@weather == 'sunny')
			erb :sunny
		elseif (@weather == 'cloudy')
			erb :cloudy
		elseif (@weather == 'snowy')
			erb :snowy
		elseif (@weather == 'rainy')
			erb :rainy
		else
			erb :default
	end
	get '/' do
	erb :home
end
end