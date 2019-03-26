library(VFS)


### Name: wth.param
### Title: Calculate weather parameters from daily data for use in climate
###   simulations
### Aliases: wth.param

### ** Examples


# GHCN daily weather file for State College, PA
# subset of data (2000-2009) for station USC00368449
#
data("weather") 

# calculate parameters for the poisson model
# using 0.3 mm as the lower limit for wet days.
weather.param.p <- wth.param(weather, method = "poisson", llim = 0.3)

# simulate ten years of rainfall
rain10.p <- rainfall(365*10, weather.param.p)

# increase per-event rainfall by 5 mm
weather.param.p5 <- weather.param.p
weather.param.p5$params$depth <- weather.param.p5$params$depth + 5
rain10.p5 <- rainfall(365*10, weather.param.p5)

# calculate parameters for the Markov chain model
# using 0.3 mm as the lower limit for wet days.
weather.param.m <- wth.param(weather, method = "markov", llim = 0.3)

# rainfall() selects Markov model based on input parameter types
rain10.m <- rainfall(365*10, weather.param.m)

# simulate 10 years of temperature
temp10 <- temperature(365*10, weather.param.p)




