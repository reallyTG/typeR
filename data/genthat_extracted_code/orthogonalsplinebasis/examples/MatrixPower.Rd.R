library(orthogonalsplinebasis)


### Name: MatrixPower
### Title: Matrix Power
### Aliases: MatrixPower
### Keywords: array algebra

### ** Examples

A<-rbind(0,cbind(diag(1:5),0))  #a nilpotent matrix
A
MatrixPower(A,3)
MatrixPower(A,5)
MatrixPower(A,6)    #Gets to a zero matrix



