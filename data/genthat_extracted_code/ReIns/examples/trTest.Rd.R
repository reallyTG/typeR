library(ReIns)


### Name: trTest
### Title: Test for truncated Pareto-type tails
### Aliases: trTest
### Keywords: htest

### ** Examples

# Sample from truncated Pareto distribution.
# truncated at 95% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.95, shape=shape))

# Test for truncation
trTest(X)


# Sample from truncated Pareto distribution.
# truncated at 99% quantile
shape <- 2
X <- rtpareto(n=1000, shape=shape, endpoint=qpareto(0.99, shape=shape))

# Test for truncation
trTest(X)



