library(spatstat)


### Name: vcov.kppm
### Title: Variance-Covariance Matrix for a Fitted Cluster Point Process
###   Model
### Aliases: vcov.kppm
### Keywords: spatial methods models

### ** Examples

   fit <- kppm(redwood ~ x + y)
   vcov(fit)
   vcov(fit, what="corr")

   # confidence interval
   confint(fit)
   # cross-check the confidence interval by hand:
   sd <- sqrt(diag(vcov(fit)))
   t(coef(fit) + 1.96 * outer(sd, c(lower=-1, upper=1)))



