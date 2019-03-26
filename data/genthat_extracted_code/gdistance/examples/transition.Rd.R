library(gdistance)


### Name: transition 
### Title: Create an object of the class Transition
### Aliases: transition transition,RasterLayer-method
###   transition,RasterBrick-method
### Keywords: spatial

### ** Examples

  #Create a new raster and set all its values to unity.
  r <- raster(nrows=18, ncols=36) 
  r <- setValues(r, runif(ncell(r)))

  #Create a Transition object from the raster
  tr <- transition(r, transitionFunction=mean, directions=4)
  tr #the sparse matrix is of class dsCMatrix (symmetric)

  #Create an asymmetric transition matrix
  #first, an arbitrary non-commutative function 
  f <- function(x) max(x) - x[1] + x[2] 
  tr2 <- transition(r, f, 4, symm=FALSE)
  tr2 #the sparse matrix is of class dgCMatrix (=asymmetric)
  
  #Barriers - interval breaks
  tr3 <- transition(r, "barriers", 8, intervalBreaks=c(0.25, 0.5, 0.75))
  nlayers(tr3)

  #Barriers - categories
  r <- round(r * 2)
  r <- asFactor(r)
  tr4 <- transition(r, "barriers", 8)
  nlayers(tr4)
  plot(raster(tr4[[2]]))
  
  #Areas
  r <- round(r * 2)
  r <- asFactor(r)
  tr5 <- transition(r, "areas", 8)
  nlayers(tr5)
  plot(raster(tr5[[2]]))



