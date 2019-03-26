library(DDD)


### Name: dd_MS_ML
### Title: Maximization of the loglikelihood under a diversity-dependent
###   diversification model with decoupling of a subclade's diversication
###   dynamics from the main clade's dynamics
### Aliases: dd_MS_ML
### Keywords: models

### ** Examples

cat("This will estimate parameters for two sets of branching times brtsM, brtsS\n")
cat("without conditioning.\n")
cat("The tolerance of the optimization is set high so runtime is fast in this example.\n")
cat("In real applications, use the default or more stringent settins for tol.\n")
brtsM = 4:10
brtsS = seq(0.1,3.5,0.7)
tsplit = 5
dd_MS_ML(brtsM = brtsM, brtsS = brtsS, tsplit = tsplit, idparsopt = c(1:3,6),
          initparsopt = c(0.885, 2e-14, 10, 4.001), idparsfix = NULL, parsfix = NULL,
          idparsnoshift = c(4,5), cond = 0, tol = c(3E-1,3E-1,3E-1))



