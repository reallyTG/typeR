library(gld)


### Name: gl.check.lambda
### Title: Function to check the validity of parameters of the generalized
###   lambda distribution
### Aliases: gl.check.lambda
### Keywords: distribution

### ** Examples

gl.check.lambda(c(0,1,.23,4.5),vect=TRUE) ## TRUE
gl.check.lambda(c(0,-1,.23,4.5),vect=TRUE) ## FALSE 
gl.check.lambda(c(0,1,0.5,-0.5),param="rs",vect=TRUE) ## FALSE
gl.check.lambda(c(0,2,1,3.4,1.2),param="fm5",vect=TRUE) ## FALSE



