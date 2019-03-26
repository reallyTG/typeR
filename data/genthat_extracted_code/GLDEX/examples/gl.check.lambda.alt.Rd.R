library(GLDEX)


### Name: gl.check.lambda.alt
### Title: Checks whether the parameters provided constitute a valid
###   generalised lambda distribution.
### Aliases: gl.check.lambda.alt
### Keywords: distribution

### ** Examples

gl.check.lambda.alt(0,1,.23,4.5,param="fmkl") ## TRUE
gl.check.lambda.alt(0,-1,.23,4.5,param="fmkl") ## FALSE 
gl.check.lambda.alt(0,1,0.5,-0.5,param="rs") ## FALSE



