library(Iboot)


### Name: Iboot-package
### Title: Iboot: iterated bootstrap tests and confidence sets
### Aliases: Iboot-package Ibootpack
### Keywords: package bootstrap iterated bootstrap double bootstrap
###   bootstrap calibration

### ** Examples

####Example 1: mean of a normal with known scale
n <- 20
mu <- 1

set.seed(1)
##contributions obtained from the score function
gr <- rnorm(n, mu) - mu

OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0.01, alpha=c(0.1, 0.05, 0.01), seed=1)

##critical values for testing H0: mu=1, H1: mu!=1
OBJ.Ib
summary(OBJ.Ib)

####Example 2: variance of a normal with known location
n <- 20
mu <- 1
sig2 <- 1

set.seed(1)
##contributions obtained from the score function
gr <- ( rnorm(n, mu, sqrt(sig2)) - mu )^2/sig2 - 1

OBJ.Ib <- Iboot(gradient=gr, B=500, M=500, kB=0.01, alpha=c(0.1, 0.05, 0.01), seed=3)

##critical values for testing H0: sig2=1, H1: sig2!=1
OBJ.Ib
summary(OBJ.Ib)



