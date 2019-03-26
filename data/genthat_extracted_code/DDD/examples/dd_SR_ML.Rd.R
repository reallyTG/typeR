library(DDD)


### Name: dd_SR_ML
### Title: Maximization of the loglikelihood under a diversity-dependent
###   diversification model with a shift in the parameters
### Aliases: dd_SR_ML
### Keywords: models

### ** Examples

cat("This will estimate parameters for a sets of branching times brts without conditioning.\n")
cat("The tolerance of the optimization is set ridiculously high to make runtime fast.\n")
cat("In real applications, use the default or more stringent settings for tol.\n")
brts = 1:10
dd_SR_ML(brts = brts, initparsopt = c(0.4581, 1E-6, 17.69, 11.09, 8.9999), idparsopt = c(1:3,6,7),
         idparsfix = NULL, parsfix = NULL, idparsnoshift = c(4,5), cond = 0,
         tol = c(1E-1,1E-1,1E-1),optimmethod = 'simplex'
)



