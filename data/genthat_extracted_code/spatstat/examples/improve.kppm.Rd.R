library(spatstat)


### Name: improve.kppm
### Title: Improve Intensity Estimate of Fitted Cluster Point Process Model
### Aliases: improve.kppm
### Keywords: spatial fit model

### ** Examples

  # fit a Thomas process using minimum contrast estimation method 
  # to model interaction between points of the pattern
  fit0 <- kppm(bei ~ elev + grad, data = bei.extra)

  # fit the log-linear intensity model with quasi-likelihood method
  fit1 <- improve.kppm(fit0, type="quasi")

  # compare
  coef(fit0)
  coef(fit1)



