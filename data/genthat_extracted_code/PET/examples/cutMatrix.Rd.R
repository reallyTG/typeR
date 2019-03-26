library(PET)


### Name: cutMatrix
### Title: Cut Matrix
### Aliases: cutMatrix
### Keywords: math smooth

### ** Examples

A <- matrix(c(rep(0,6),0:2,0,3,4,rep(0,4),5,6,rep(0,9)),nrow=3)
A
cutMatrix(A)
cutMatrix(A,mode="row")
rm(A)



