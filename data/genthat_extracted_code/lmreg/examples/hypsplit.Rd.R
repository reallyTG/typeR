library(lmreg)


### Name: hypsplit
### Title: Testable and untestable hypotheses in linear model
### Aliases: hypsplit
### Keywords: htest model design regression

### ** Examples

data(denim)
attach(denim)
X <- cbind(1, binaries(Denim), binaries(Laundry))
A <- rbind(c(0,1,0,0,0,0,0), c(0,0,1,0,0,0,0), c(0,0,0,1,0,0,0))
xi <- c(0,0,0)
hypotheses <- hypsplit(X, A, xi, tol=1e-13)
hypotheses[[1]]  # testable
hypotheses[[2]]  # untestable
detach(denim)



