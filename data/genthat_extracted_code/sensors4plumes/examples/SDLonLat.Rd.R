library(sensors4plumes)


### Name: SDLonLat
### Title: Transform locations of simulations into longitude latitude
###   coordinates
### Aliases: SDLonLat

### ** Examples

data(radioactivePlumes)
data(SDgenetic)
LL1 = SDLonLat(simulations = radioactivePlumes, SD = SDgenetic[["SD"]])
plot(LL1[[1]])



