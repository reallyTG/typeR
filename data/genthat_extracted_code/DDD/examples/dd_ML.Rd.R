library(DDD)


### Name: dd_ML
### Title: Maximization of the loglikelihood under a diversity-dependent
###   diversification model
### Aliases: dd_ML
### Keywords: models

### ** Examples

cat("Estimating the intrinsic speciation rate lambda and the carrying capacity K")
cat("for a fixed extinction rate of 0.1, conditioning on clade survival and two missing species:")
brts = 1:5
dd_ML(brts = brts,initparsopt = c(1.3078,7.4188), idparsopt = c(1,3), parsfix = 0.1,
      cond = 1, missnumspec = 2, tol = c(1E-3,1E-3,1E-4), optimmethod = 'simplex')



