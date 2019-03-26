library(mixtools)


### Name: regmixEM.lambda
### Title: EM Algorithm for Mixtures of Regressions with Local Lambda
###   Estimates
### Aliases: regmixEM.lambda
### Keywords: file

### ** Examples

## Compare a 2-component and 3-component fit to NOdata.

data(NOdata)
attach(NOdata)
set.seed(100)
out1 <- regmixEM.lambda(Equivalence, NO)
out2 <- regmixEM.lambda(Equivalence, NO, k = 3)
c(out1$loglik, out2$loglik)




