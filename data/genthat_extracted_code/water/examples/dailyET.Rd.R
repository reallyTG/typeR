library(water)


### Name: dailyET
### Title: Calculates daily ET using Penman Monteith hourly formula for
###   every hour
### Aliases: dailyET

### ** Examples

csvfile <- system.file("extdata", "apples.csv", package="water")

WeatherStation <- read.WSdata(WSdata = csvfile, date.format = "%d/%m/%Y", 
lat=-35.42222, long= -71.38639, elev=201, height= 2.2, cf=c(1,0.2777778,1,1))

dailyET(WeatherStation = WeatherStation, lat=-35.422, long=-71.386, elev=124, 
ET="ETo")




