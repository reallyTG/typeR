library(SmarterPoland)


### Name: Dark Sky API for weather forecast
### Title: Access to Weather Forecasts with the Use of Dark Sky API.
### Aliases: getWeatherForecast
### Keywords: database

### ** Examples

## Not run: 
##D  # you have to have apiKey to execute these examples
##D library(scales)
##D library(ggplot2)
##D 
##D prognoza <- getWeatherForecast(apiKey, city='Warsaw')
##D 
##D ggplot(prognoza$by.hour, aes(y=temperatureCelsius, x=time)) + 
##D   geom_line() + geom_point() +
##D   geom_point(data=prognoza$now, size=10, color='red') +
##D   theme(title=element_text(size=20),
##D         axis.text=element_text(size=20)) + 
##D   scale_x_datetime(breaks = date_breaks("3 hour"),
##D                    minor_breaks = date_breaks("1 hour"),
##D                    labels = date_format("##D 
##D   ylab("") + xlab("") + ggtitle("Prognoza temperatury dla Warszawy")
##D 
## End(Not run)



