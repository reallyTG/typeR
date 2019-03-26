library(pcg)


### Name: pcg
### Title: Preconditioned Conjugate Gradient algorithm for solving Ax=b
### Aliases: pcg
### Keywords: preconditioned conjugate gradient linear system of equations
###   quadratic function

### ** Examples

A=matrix(rnorm(100*100,mean=10,sd=2),100,100)
A=t(A)%*%A
b=rnorm(100)
pcg(A,b)



