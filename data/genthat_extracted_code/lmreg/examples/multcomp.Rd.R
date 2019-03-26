library(lmreg)


### Name: multcomp
### Title: Multiple comparison tests
### Aliases: multcomp
### Keywords: htest model design regression

### ** Examples

data(denim)
attach(denim)
X <- cbind(1,binaries(Denim),binaries(Laundry))
A <- rbind(c(0,1,-1,0,0,0,0),c(0,1,0,-1,0,0,0),c(0,0,1,-1,0,0,0))
xi <- c(0,0,0)
multcomp(Abrasion, X, A, xi, tol=1e-14)
detach(denim)



