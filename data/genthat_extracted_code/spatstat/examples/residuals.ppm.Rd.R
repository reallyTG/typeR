library(spatstat)


### Name: residuals.ppm
### Title: Residuals for Fitted Point Process Model
### Aliases: residuals.ppm
### Keywords: spatial models methods

### ** Examples

   fit <- ppm(cells, ~x, Strauss(r=0.15))

   # Pearson residuals
   rp <- residuals(fit, type="pe")
   rp

   # simulated data
   X <- rStrauss(100,0.7,0.05)
   # fit Strauss model 
   fit <- ppm(X, ~1, Strauss(0.05))
   res.fit <- residuals(fit)

   # check that total residual is 0 
   integral.msr(residuals(fit, drop=TRUE))

   # true model parameters
   truecoef <- c(log(100), log(0.7))
   res.true <- residuals(fit, new.coef=truecoef)  



