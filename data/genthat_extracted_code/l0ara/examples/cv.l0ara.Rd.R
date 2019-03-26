library(l0ara)


### Name: cv.l0ara
### Title: cross-validation for l0ara
### Aliases: cv.l0ara

### ** Examples

#' # Linear regression
# Generate design matrix and response variable
n <- 100
p <- 40
x <- matrix(rnorm(n*p), n, p)
beta <- c(1,0,2,3,rep(0,p-4))
noise <- rnorm(n)
y <- x%*%beta+noise
lam <- c(0.1, 0.3, 0.5)
fit <- cv.l0ara(x, y, family="gaussian", lam, measure = "mse")



