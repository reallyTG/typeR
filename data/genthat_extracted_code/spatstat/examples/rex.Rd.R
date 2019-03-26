library(spatstat)


### Name: rex
### Title: Richardson Extrapolation
### Aliases: rex
### Keywords: math optimize

### ** Examples

   # integrals of sin(x) and cos(x) from 0 to pi
   # correct answers: 2, 0
   est <- function(nsteps) {
     xx <- seq(0, pi, length=nsteps)
     ans <- pi * c(mean(sin(xx)), mean(cos(xx)))
     names(ans) <- c("sin", "cos")
     ans
   }
   X <- cbind(est(10), est(20), est(40))
   X
   rex(X)
   rex(X, recursive=TRUE)

   # fitted Gibbs point process model
   fit0 <- ppm(cells ~ 1, Strauss(0.07), nd=16)
   fit1 <- update(fit0, nd=32)
   fit2 <- update(fit0, nd=64)
   co <- cbind(coef(fit0), coef(fit1), coef(fit2))
   co 
   rex(co, k=2, recursive=TRUE)



