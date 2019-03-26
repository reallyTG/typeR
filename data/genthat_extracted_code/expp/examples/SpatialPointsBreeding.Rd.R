library(expp)


### Name: SpatialPointsBreeding-class
### Title: Converts a 'data.frame' to an object of class
###   'SpatialPointsBreeding'
### Aliases: SpatialPointsBreeding-class SpatialPointsBreeding
###   plot,SpatialPointsBreeding,missing-method
###   plot,SpatialPointsBreeding,eppMatrix-method

### ** Examples

d = data.frame(
  x = c(4, 17, 16, 41, 41, 43, 86, 62, 71, 92, 95,53, 34, 27, 53), 
  y = c(3, 18, 36, 6, 18, 50, 3, 21, 40, 43, 57, 62, 62, 45, 37), 
  id = 1:15,male = paste0('m', 1:15), female = paste0('f', 1:15), 
    stringsAsFactors = FALSE)

b = SpatialPointsBreeding(d, id = 'id', breeding = ~ male+female)    

plot(b)





