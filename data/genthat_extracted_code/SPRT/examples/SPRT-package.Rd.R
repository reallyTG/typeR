library(SPRT)


### Name: SPRT-package
### Title: The SPRT package
### Aliases: SPRT-package
### Keywords: package

### ** Examples

# SPRT on a normally distributed random variable
set.seed(123)
test <- SPRT(distribution = "normal", type1 = 0.05, type2 = 0.20,
	h0 = 0, h1 = 1, values = rnorm(10))

# Test outcome
test

# Cum. sum of the random variable vs H0 and H1 boundaries
test$data.sum
plot(test)

# Log-likelihood ratio vs Wald's A and B boundaries
test$data.llr
plot(test, log = "y")

# Log-likelihood ratio across scalars or vectors
set.seed(123)
test$llr.fn(n = 10, sum(rnorm(10)))

set.seed(123)
test$llr.fn(n = seq(1,10,1), k = cumsum(rnorm(10)))

# H0 and H1 boundaries
test$h0.fn(n = seq(1,10,1))
test$h1.fn(n = seq(1,10,1))



