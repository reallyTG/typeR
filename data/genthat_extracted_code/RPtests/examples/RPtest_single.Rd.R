library(RPtests)


### Name: RPtest_single
### Title: Test significance of single predictors
### Aliases: RPtest_single

### ** Examples

x <- scale(matrix(rnorm(50*100), 50, 100))
x <- scale(x)
y <- as.numeric(x[, 1:5] %*% rep(1, 5) + rnorm(nrow(x)))
out <- RPtest_single(x=x, y=y, B=25)



