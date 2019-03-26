library(mixtools)


### Name: regmixEM.loc
### Title: Iterative Algorithm Using EM Algorithm for Mixtures of
###   Regressions with Local Lambda Estimates
### Aliases: regmixEM.loc
### Keywords: file

### ** Examples

## Compare a 2-component and 3-component fit to NOdata.

data(NOdata)
attach(NOdata)
set.seed(100)
out1 <- regmixEM.loc(Equivalence, NO, kernl.h = 2, 
                     epsilon = 1e-02, verb = TRUE)
out2 <- regmixEM.loc(Equivalence, NO, kernl.h = 2, k = 3,
                     epsilon = 1e-02, verb = TRUE)
c(out1$loglik, out2$loglik)




