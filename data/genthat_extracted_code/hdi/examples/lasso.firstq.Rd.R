library(hdi)


### Name: lasso.firstq
### Title: Determine the first q Predictors in the Lasso Path
### Aliases: lasso.firstq
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*1000), nrow = 100, ncol = 1000)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
sel <- lasso.firstq(x, y, q = 5)
sel # 5 integers from {1,2, ..., 1000},  including '1' and '2', typically



