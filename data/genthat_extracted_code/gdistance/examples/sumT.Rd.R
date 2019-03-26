library(gdistance)


### Name: sumReciprocal
### Title: Reciprocal of the sum of the reciprocals of conductance values
###   in Transition* objects
### Aliases: sumReciprocal
### Keywords: spatial

### ** Examples

  #Create a new raster and set all its values to unity.
  raster <- raster(nrows=18, ncols=36) 
  raster <- setValues(raster,rep(1,ncell(raster)))

  #Create TransitionLayer objects
  tr1 <- transition(raster,mean,4)
  tr2 <- tr1
  matrixValues(tr1)
  
  #Set one to resistance
  matrixValues(tr2) <- "resistance"
  
  #Sum the two objects
  sumReciprocal(tr1,tr2)



