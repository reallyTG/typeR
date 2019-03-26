library(Ball)


### Name: bcor
### Title: Ball Correlation and Covariance Statistics
### Aliases: bcor bcov

### ** Examples

############# Ball Correlation #############
num <- 50
x <- 1:num
y <- 1:num
bcor(x, y)
bcor(x, y, weight = TRUE)
bcor(x, y, weight = "prob")
bcor(x, y, weight = "chisq")
############# Ball Covariance #############
n <- 50
x <- rnorm(n)
y <- rnorm(n)
bcov(x, y)
bcov(x, y, weight = TRUE)
bcov(x, y, weight = "prob")
bcov(x, y, weight = "chisq")



