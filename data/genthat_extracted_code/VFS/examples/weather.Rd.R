library(VFS)


### Name: weather
### Title: Ten years of daily weather data
### Aliases: weather
### Keywords: datasets

### ** Examples


# state college GHCN data
#
# created by:
# weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))
data("weather") # same object: 10 years of daily weather data

weather.param <- wth.param(weather, method="markov")

rain.compare <- rainfall(365*3, weather.param)
temp.compare <- temperature(365*3, weather.param)




