library(fitur)


### Name: GOFTests
### Title: Wrappers to compute goodness of fit test froms distfun objects
### Aliases: GOFTests ks_test ad_test.distfun ad_test cvm_test.distfun
###   cvm_test

### ** Examples

x <- rgamma(100, 1, 1)
fit <- fit_univariate(x, 'gamma')
ks_test(fit, x)
ad_test(fit, x)
cvm_test(fit, x)



