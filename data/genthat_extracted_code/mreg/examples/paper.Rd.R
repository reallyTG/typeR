library(mreg)


### Name: paper
### Title: An example of a function to calculate the effect on the location
###   that depends on previous outcome in an mreg model
### Aliases: paper
### Keywords: regression programming

### ** Examples


## The function is currently defined as
function(x,y, mod.Z){
  #x is the imputed response
  #y is the set of parameters
  #mod.Z is a VECTOR/matrix of explanatory variables
  rad.type <- cut(x, breaks=c(-1,0,4,9,50))
  if( is.vector(mod.Z)){
    arthdur.first <- rep(mod.Z[2],length(x))
  }
  else{
    arthdur.first <- rep(mod.Z[1,2], length(x))
  }
  X <- model.matrix( ~rad.type+I(x==0):arthdur.first)
  structure( X[,-1, drop=FALSE]%*%y, par.names= colnames( X)[-1],par.dim=dim(X)[2]-1)
  }



