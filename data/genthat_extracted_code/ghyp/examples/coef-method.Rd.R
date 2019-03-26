library(ghyp)


### Name: coef-method
### Title: Extract parameters of generalized hyperbolic distribution
###   objects
### Aliases: coef.ghyp coef,ghyp-method coefficients,ghyp-method
### Keywords: methods utilities

### ** Examples

  ghyp.mv <- ghyp(lambda = 1, alpha.bar = 0.1, mu = rep(0,2), sigma = diag(rep(1,2)),
                  gamma = rep(0,2), data = matrix(rt(1000, df = 4), ncol = 2))
  ## Get parameters
  coef(ghyp.mv, type = "alpha.bar")
  coefficients(ghyp.mv, type = "chi.psi")

  ## Simple modification (do not modify slots directly e.g. object@mu <- 0:1)
  param <- coef(ghyp.mv, type = "alpha.bar")
  param$mu <- 0:1
  do.call("ghyp", param) # returns a new 'ghyp' object





