library(gdistance)


### Name: Transition* methods
### Title: Extracting and replacing: class Transition
### Aliases: [,TransitionLayer,numeric,numeric,missing-method
###   [,TransitionLayer,matrix,missing,missing-method
###   [<-,TransitionLayer,matrix,missing,ANY-method
###   [<-,TransitionLayer,numeric,numeric,ANY-method
###   [[,TransitionStack,numeric,missing-method
###   [[<-,TransitionStack,numeric,missing,TransitionData-method
### Keywords: methods

### ** Examples

  #Create a new raster and set all its values to unity.
  r <- raster(nrows=18, ncols=36) 
  r <- setValues(r,rep(1,ncell(r)))

  #Create TransitionLayer objects
  tr1 <- transition(r,mean,4)
  tr2 <- tr1

  #Extracting and replacing
  tr1[cbind(1:9,1:9)] <- tr2[cbind(1:9,1:9)]
  tr1[1:9,1:9] <- tr2[1:9,1:9]
  tr1[1:5,1:5]



