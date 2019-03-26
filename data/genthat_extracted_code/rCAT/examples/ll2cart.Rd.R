library(rCAT)


### Name: ll2cart
### Title: Geographic coordinates to cartesian (x,y,z)
### Aliases: ll2cart

### ** Examples

lat <- runif (200,-24,-12)
long <- runif (200,43,51)
thepoints <- data.frame(lat,long)
llrad <- deg2rad(thepoints)
cartp <- ll2cart(llrad$lat,llrad$long)



