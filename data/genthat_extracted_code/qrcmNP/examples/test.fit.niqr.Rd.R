library(qrcmNP)


### Name: test.fit.niqr
### Title: Goodness-of-Fit Test
### Aliases: test.fit.niqr
### Keywords: htest

### ** Examples


n <- 300
x <- runif(n)
fun <- function(theta, p){
  beta0 <- theta[1] + exp(theta[2]*p)
  beta1 <- theta[3] + theta[4]*p
  cbind(beta0, beta1)}
beta <- fun(c(1,1,1,1), runif(n))
y <- beta[, 1] + beta[, 2]*x
model <- niqr(fun=fun, x0=rep(0, 4), X=cbind(1,x), y=y)
## Not run: test.fit.niqr(model, R=100)



