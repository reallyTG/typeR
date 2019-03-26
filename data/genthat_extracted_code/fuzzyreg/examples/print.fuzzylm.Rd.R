library(fuzzyreg)


### Name: print.fuzzylm
### Title: Prints Fuzzy Linear Regression Result
### Aliases: print.fuzzylm
### Keywords: fuzzy

### ** Examples

x <- rep(1:3, each = 5)
y <- c(rnorm(5, 1), rnorm(5, 2), rnorm(5, 3))
dat <- data.frame(x = x, y = y)
f <- fuzzylm(y ~ x, dat)
f



