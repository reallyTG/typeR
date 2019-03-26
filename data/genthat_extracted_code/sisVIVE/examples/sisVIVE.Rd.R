library(sisVIVE)


### Name: sisVIVE
### Title: Some Invalid Some Valid Instrumental Variables Estimator
### Aliases: sisVIVE
### Keywords: sisVIVE

### ** Examples

library(MASS)
library(lars)

n = 1000; L = 10; s= 3;
Z <- matrix(rnorm(n*L),n,L)
error <- mvrnorm(n,rep(0,2),matrix(c(1,0.8,0.8,1),2,2))
intD = rnorm(1); ZtoD =   rnorm(L,0,1); ZtoY = c(rnorm(s),rep(0,L-s)); DtoY = 1; intY = rnorm(1)
D = intD + Z %*% ZtoD + error[,1]
Y = intY + Z %*% ZtoY + D * DtoY + error[,2]

result = sisVIVE(Y,D,Z)
summary(result)



