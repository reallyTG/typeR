library(WaveletComp)


### Name: weather.radiation.Mannheim
### Title: Series of weather data and ambient gamma dose rate readings
### Aliases: weather.radiation.Mannheim
### Keywords: datasets

### ** Examples

data(weather.radiation.Mannheim)

plot(as.Date(weather.radiation.Mannheim$date, tz = "UTC"),
     weather.radiation.Mannheim$radiation, type = "l",
     xlab = "day", 
     ylab = "mean daily ambient gamma dose rate (ODL) in microsieverts per hour")



