library(ldr)


### Name: structure.test
### Title: Test of covariance structure for PFC models
### Aliases: structure.test

### ** Examples

data(bigmac)
fit1 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly", 
        degree=3), numdir=3, structure="iso")
fit2 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly", 
        degree=3), numdir=3, structure="aniso")
fit3 <- pfc(X=bigmac[,-1], y=bigmac[,1], fy=bf(y=bigmac[,1], case="poly", 
        degree=3), numdir=3, structure="unstr")
structure.test(fit1, fit3)
structure.test(fit2, fit3)



