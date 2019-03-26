library(VFS)


### Name: temperature
### Title: Generate simulated mean temperature
### Aliases: temperature
### Keywords: datagen

### ** Examples

# A sample GHCN daily weather file for State College, PA, is included with this package.
# This file contains a subset of data (1980-2009) for station USC00368449
data("weather") 

# calculate parameters for the poisson model, using 0.3 mm as the lower limit for wet days.
weather.param.p <- wth.param(weather, method = "poisson", llim = 0.3)

# simulate 10 years of temperature
temp10 <- temperature(365*10, weather.param.p)




