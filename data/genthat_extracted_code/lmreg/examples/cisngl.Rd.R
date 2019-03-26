library(lmreg)


### Name: cisngl
### Title: Confidence interval for a linear parametric function in a linear
###   model
### Aliases: cisngl
### Keywords: htest model design regression

### ** Examples

data(birthwt)
attach(birthwt)
X <- cbind(1, SMOKE, binaries(RACE))
p <- c(0,1,0,0,0)
cisngl(BWT, X, p, 0.05, type = "upper", tol = 1e-10)
cisngl(BWT, X, p, 0.05, type = "both", tol = 1e-10) 
detach(birthwt)



