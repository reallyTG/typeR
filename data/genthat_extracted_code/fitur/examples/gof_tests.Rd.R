library(fitur)


### Name: gof_tests
### Title: Goodness of Fit Testing
### Aliases: gof_tests

### ** Examples

set.seed(84)
x <- rgamma(100, 1, 1)
dists <- c('gamma', 'lnorm', 'weibull')
multipleFits <- lapply(dists, fit_univariate, x = x)
gof_tests(multipleFits, x)



