library(calibrator)


### Name: V1
### Title: Distance matrix
### Aliases: V1
### Keywords: array

### ** Examples

data(toys)
V1(D1=D1.toy,  other=NULL,   phi=phi.toy)
V1(D1=D1.toy[1,,drop=FALSE], other=NULL, phi=phi.toy)

V1(D1=D1.toy,  other=D1.toy[1:3,],   phi=phi.toy)

V1(D1=D1.toy,other=D1.fun(x.star=x.vec,t.vec=theta.toy),phi=phi.toy)




