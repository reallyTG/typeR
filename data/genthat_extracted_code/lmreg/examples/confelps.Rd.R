library(lmreg)


### Name: confelps
### Title: Confidence ellipsiod for multiple parameters in a linear model.
### Aliases: confelps
### Keywords: htest model design regression

### ** Examples

data(denim)
attach(denim)
X <- cbind(1,binaries(Denim),binaries(Laundry))
A <- rbind(c(0,1,0,-1,0,0,0),c(0,0,1,-1,0,0,0))
confelps(Abrasion, X, A, 0.05,tol=1e-12)
detach(denim)



