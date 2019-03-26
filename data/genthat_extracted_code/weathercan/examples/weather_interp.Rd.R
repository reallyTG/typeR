library(weathercan)


### Name: weather_interp
### Title: Interpolate and add weather data to a dataframe
### Aliases: weather_interp add_weather

### ** Examples


# Weather data only
head(kamloops)

# Data about finch observations at RFID feeders in Kamloops, BC
head(finches)

# Match weather to finches
## No test: 
## Not run
finch_weather <- weather_interp(data = finches, weather = kamloops)
## End(No test)




