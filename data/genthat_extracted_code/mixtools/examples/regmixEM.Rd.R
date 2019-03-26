library(mixtools)


### Name: regmixEM
### Title: EM Algorithm for Mixtures of Regressions
### Aliases: regmixEM
### Keywords: file

### ** Examples

## EM output for NOdata.
 
data(NOdata)
attach(NOdata)
set.seed(100)
em.out <- regmixEM(Equivalence, NO, verb = TRUE, epsilon = 1e-04)
em.out[3:6]



