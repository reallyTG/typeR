library(multiway)


### Name: smpower
### Title: Symmetric Matrix Power
### Aliases: smpower
### Keywords: array algebra

### ** Examples

##########   EXAMPLE   ##########

X <- crossprod(matrix(rnorm(2000),100,20))
Xsqrt <- smpower(X)         # square root
Xinv <- smpower(X,-1)       # inverse
Xisqrt <- smpower(X,-0.5)   # inverse square root




