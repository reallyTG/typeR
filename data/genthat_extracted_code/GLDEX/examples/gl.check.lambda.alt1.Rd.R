library(GLDEX)


### Name: gl.check.lambda.alt1
### Title: Checks whether the parameters provided constitute a valid
###   generalised lambda distribution.
### Aliases: gl.check.lambda.alt1
### Keywords: distribution

### ** Examples

gl.check.lambda.alt1(c(0,1,.23,4.5),param="fmkl",vect=TRUE) 
## TRUE, Using vector input of parameter values.
gl.check.lambda.alt1(0,-1,.23,4.5,param="fmkl") ## FALSE 
gl.check.lambda.alt1(0,1,0.5,-0.5,param="rs") ## FALSE



