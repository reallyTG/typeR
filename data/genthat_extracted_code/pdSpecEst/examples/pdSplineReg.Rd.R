library(pdSpecEst)


### Name: pdSplineReg
### Title: Cubic smoothing spline regression for HPD matrices
### Aliases: pdSplineReg

### ** Examples

## Not run: 
##D set.seed(2)
##D P <- rExamples1D(50, example = 'gaussian', noise.level = 0.1)
##D P.spline <- pdSplineReg(P$P, P$P, lam = 0.5, Nd = 25)
##D 
##D ## Examine matrix-component (1,1)
##D plot((1:50)/50, Re(P$P[1, 1, ]), type = "l", lty = 2) ## noisy observations
##D lines((1:25)/25, Re(P.spline$f[1, 1, ])) ## estimate
##D lines((1:50)/50, Re(P$f[1, 1, ]), col = 2, lty = 2) ## smooth target
## End(Not run)



