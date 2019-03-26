library(RFreak)


### Name: robreg.evol
### Title: Robust Evolutionary Regression
### Aliases: robreg.evol lmsreg.evol lqdreg.evol lqsreg.evol ltareg.evol
###   ltsreg.evol
### Keywords: robust interface

### ** Examples

# load example data
data(stackloss)

# compute different regressions
robreg.evol(stackloss[, 1:3], stackloss[, 4], method= "lts", generations=1000)
lqsreg.evol(stackloss[, 1:3], stackloss[, 4], generations=1000)
lqdreg.evol(stackloss[, 1:3], stackloss[, 4], generations=1000)



