library(bayesm)


### Name: createX
### Title: Create X Matrix for Use in Multinomial Logit and Probit Routines
### Aliases: createX
### Keywords: array utilities

### ** Examples

na=2; nd=1; p=3
vec = c(1, 1.5, 0.5, 2, 3, 1, 3, 4.5, 1.5)
Xa = matrix(vec, byrow=TRUE, ncol=3)
Xa = cbind(Xa,-Xa)
Xd = matrix(c(-1,-2,-3), ncol=1)
createX(p=p, na=na, nd=nd, Xa=Xa, Xd=Xd)
createX(p=p, na=na, nd=nd, Xa=Xa, Xd=Xd, base=1)
createX(p=p, na=na, nd=nd, Xa=Xa, Xd=Xd, DIFF=TRUE)
createX(p=p, na=na, nd=nd, Xa=Xa, Xd=Xd, DIFF=TRUE, base=2)
createX(p=p, na=na, nd=NULL, Xa=Xa, Xd=NULL)
createX(p=p, na=NULL, nd=nd, Xa=NULL, Xd=Xd)



