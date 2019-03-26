library(fuzzyreg)


### Name: plrls
### Title: Fuzzy Linear Regression using the Possibilistic Linear
###   Regression with Least Squares Method
### Aliases: plrls
### Keywords: fuzzy

### ** Examples

x <- matrix(c(rep(1, 15), rep(1:3, each = 5)), ncol = 2)
y <- matrix(c(rnorm(5, 1), rnorm(5, 2), rnorm(5, 3)), ncol = 1)
plrls(x = x, y = y)



