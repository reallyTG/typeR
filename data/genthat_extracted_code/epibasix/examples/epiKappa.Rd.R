library(epibasix)


### Name: epiKappa
### Title: Computation of the Kappa Statistic for Agreement Between Two
###   Raters
### Aliases: epiKappa print.epiKappa summary.epiKappa
### Keywords: design multivariate htest

### ** Examples

X <- cbind(c(28,5), c(4,61));
summary(epiKappa(X, alpha=0.05, k0 = 0.6));



