library(plsdof)


### Name: krylov
### Title: Krylov sequence
### Aliases: krylov
### Keywords: math

### ** Examples

A<-matrix(rnorm(8*8),ncol=8)
b<-rnorm(8)
K<-krylov(A,b,4)



