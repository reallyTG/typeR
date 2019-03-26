library(SpatialEpi)


### Name: zones
### Title: Create set of all single zones and output geographical
###   information
### Aliases: zones
### Keywords: file

### ** Examples

data(pennLC)
geo <- pennLC$geo[,2:3]
geo <- latlong2grid(geo)
population <- tapply(pennLC$data$population, pennLC$data$county, sum)
pop.upper.bound <- 0.5
geo.info <- zones(geo, population, pop.upper.bound)



