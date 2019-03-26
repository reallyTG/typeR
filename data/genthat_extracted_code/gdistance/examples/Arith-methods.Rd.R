library(gdistance)


### Name: ArithMath-methods
### Title: Arithmetic and mathematical operations with objects of
###   Transition* classes
### Aliases: Arith-methods Arith,ANY,TransitionLayer-method
###   Arith,TransitionLayer,ANY-method
###   Arith,TransitionLayer,TransitionLayer-method
###   Arith,TransitionLayer,TransitionStack-method
###   Arith,TransitionStack,TransitionLayer-method
###   Arith,TransitionStack,ANY-method Arith,ANY,TransitionStack-method
###   Arith,TransitionLayer,TransitionStack-method Math-methods
###   Math,TransitionLayer-method Math,TransitionStack-method
### Keywords: methods math spatial

### ** Examples

  #create a new raster and set all its values to unity.
  raster <- raster(nrows=18, ncols=36) 
  raster <- setValues(raster,rep(1,ncell(raster)))

  #create TransitionLayer objects
  tr1 <- transition(raster,mean,4)
  tr2 <- tr1

  #arithmetic operations
  tr3 <- tr1 * tr2
  tr4 <- tr3 * 4
  
  #mathematical operations
  tr5 <- sqrt(tr4)



