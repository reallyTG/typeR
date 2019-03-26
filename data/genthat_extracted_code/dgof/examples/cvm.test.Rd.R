library(dgof)


### Name: cvm.test
### Title: Discrete Cramer-von Mises Goodness-of-Fit Tests
### Aliases: cvm.test
### Keywords: htest

### ** Examples

require(dgof)

x3 <- sample(1:10, 25, replace=TRUE)

# Using ecdf() to specify a discrete distribution:
ks.test(x3, ecdf(1:10))
cvm.test(x3, ecdf(1:10))

# Using step() to specify the same discrete distribution:
myfun <- stepfun(1:10, cumsum(c(0, rep(0.1, 10))))
ks.test(x3, myfun)
cvm.test(x3, myfun)

# Usage of U2 for cyclical distributions (note U2 unchanged, but W2 not)

set.seed(1)
y <- sample(1:4, 20, replace=TRUE)
cvm.test(y, ecdf(1:4), type='W2')
cvm.test(y, ecdf(1:4), type='U2')
z <- y
cvm.test(z, ecdf(1:4), type='W2')
cvm.test(z, ecdf(1:4), type = 'U2')

# Compare analytic results to simulation results
set.seed(1)
y <- sample(1:3, 10, replace=TRUE)
cvm.test(y, ecdf(1:6), simulate.p.value=FALSE)
cvm.test(y, ecdf(1:6), simulate.p.value=TRUE)




