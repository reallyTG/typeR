library(lmreg)


### Name: cisimult
### Title: Simultaneous confidence intervals in a linear model
### Aliases: cisimult
### Keywords: htest model design regression

### ** Examples

data(denim)
attach(denim)
X <- cbind(1, binaries(Denim), binaries(Laundry))
A <- rbind(c(0,1,-1,0,0,0,0), c(0,1,0,-1,0,0,0), c(0,0,1,-1,0,0,0))
cisimult(Abrasion, X, A, 0.05, tol = 1e-10)
detach(denim)



