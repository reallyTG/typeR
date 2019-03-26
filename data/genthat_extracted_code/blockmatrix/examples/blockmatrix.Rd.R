library(blockmatrix)


### Name: blockmatrix
### Title: This function builds a blockmatrix
### Aliases: blockmatrix

### ** Examples

rm(list=ls())
library(blockmatrix)

A <- array(rnorm(9,mean=1),c(3,3))
B <- 0 #array(rnorm(9,mean=2),c(3,3))
C <- 0
D <- array(rnorm(9,mean=4),c(3,3))
F <- array(rnorm(9,mean=10),c(3,3))

M <- blockmatrix(names=c("A","0","D","0"),A=A,D=D,dim=c(2,2))
E <- blockmatrix(names=c("0","F","D","0"),F=F,D=D,dim=c(2,2))

R <- M+E
S <- solve(R)
P <- blockmatmult(R,E)

l <- list(A=A,B=B,C=C,D=D,F=F)
mv <- array(c("A","B","C","D","F","F"),c(3,2))
BB <- blockmatrix(value=mv,list=l)



