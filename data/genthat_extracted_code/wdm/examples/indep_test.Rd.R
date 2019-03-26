library(wdm)


### Name: indep_test
### Title: Independence Tests for Weighted Dependence Measures
### Aliases: indep_test

### ** Examples

x <- rnorm(100)
y <- rpois(100, 1)  # all but Hoeffding's D can handle ties
w <- runif(100)

indep_test(x, y, method = "kendall")               # unweighted
indep_test(x, y, method = "kendall", weights = w)  # weighted




