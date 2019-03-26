library(fuzzyreg)


### Name: print.summary.fuzzylm
### Title: Prints Fuzzy Linear Regression Summary
### Aliases: print.summary.fuzzylm
### Keywords: fuzzy

### ** Examples

x <- rep(1:3, each = 5)
y <- c(rnorm(5, 1), rnorm(5, 2), rnorm(5, 3))
dat <- data.frame(x = x, y = y)
f <- fuzzylm(y ~ x, dat)
sum.f <- summary(f)
sum.f



