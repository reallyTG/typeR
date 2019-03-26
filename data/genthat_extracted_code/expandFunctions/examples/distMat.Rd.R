library(expandFunctions)


### Name: distMat
### Title: Make a matrix with coefficients distributed as dist
### Aliases: distMat

### ** Examples

X <- distMat(10,2)
X <- distMat(10,2,distOpt=list(mean=1,sd=2))
X <- distMat(5,3,rnorm,list(mean=1,sd=2))
X <- distMat(5,3,rnorm,list(sd=2))
X <- distMat(50,3,rt,list(df=3))



