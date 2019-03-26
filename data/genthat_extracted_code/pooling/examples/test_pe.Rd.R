library(pooling)


### Name: test_pe
### Title: Test for Underestimated Processing Error Variance in Pooling
###   Studies
### Aliases: test_pe

### ** Examples

# Generate data for hypothetical study designed assuming sigsq_p = 0.1, but
# truly sigsq_p = 0.25. Have data collected for 40 pools of size 5, and wish
# to test H0: sigsq_p <= 0.1. In this instance, a false negative occurs.
set.seed(123)
xtilde <- replicate(n = 40, expr = mean(rnorm(5)) + rnorm(n = 1, sd = sqrt(0.25)))
(fit <- test_pe(xtilde = xtilde, g = 5, sigsq = 1, sigsq_m = 0))





