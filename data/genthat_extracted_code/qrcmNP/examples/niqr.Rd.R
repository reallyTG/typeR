library(qrcmNP)


### Name: niqr
### Title: Nonlinear Quantile Regression Coefficients Modeling
### Aliases: niqr
### Keywords: models regression

### ** Examples


set.seed(1234)
n <- 300
x <- runif(n)
fun <- function(theta, p){
  beta0 <- theta[1] + exp(theta[2]*p)
  beta1 <- theta[3] + theta[4]*p
  cbind(beta0, beta1)}
beta <- fun(c(1,1,1,1), runif(n))
y <- beta[, 1] + beta[, 2]*x
model <- niqr(fun=fun, x0=rep(.5, 4), X=cbind(1,x), y=y)

## Not run: 
##D # NOT RUN---qgamma function
##D set.seed(1234)
##D n <- 1000
##D x <- runif(n)
##D fun2 <- function(theta, p){
##D   beta0 <- theta[1] + qgamma(p, exp(theta[2]), exp(theta[3]))
##D   beta1 <- theta[4] + theta[5]*p
##D   cbind(beta0, beta1)
##D }
##D beta <- fun2(c(1,2,2,1,1), runif(n))
##D y <- beta[, 1] + beta[, 2]*x
##D model <- niqr(fun=fun2, x0=rep(.5, 5), X=cbind(1,x), y=y)
##D 
##D # NOT RUN---qbeta function
##D set.seed(1234)
##D n <- 1000
##D x <- runif(n)
##D fun3 <- function(theta, p){
##D   beta0 <- theta[1] + theta[2]*qbeta(p, exp(theta[3]), exp(theta[4]))
##D   beta1 <- theta[5] + theta[6]*p
##D   cbind(beta0, beta1)
##D }
##D beta <- fun3(c(1,1.5,.5,.2,1,1), runif(n))
##D y <- beta[, 1] + beta[, 2]*x
##D model <- niqr(fun=fun3, x0=rep(.5, 6), X=cbind(1,x), y=y)
##D 
##D # NOT RUN---qt function
##D set.seed(1234)
##D n <- 1000
##D x <- runif(n)
##D fun4 <- function(theta, p){
##D   beta0 <- theta[1] + exp(theta[2])*qt(p, 1+exp(theta[3]), exp(theta[4]))
##D   beta1 <- theta[5] + theta[6]*p
##D   cbind(beta0, beta1)
##D }
##D beta <- fun4(c(1,.5,.3,.2,1,1), runif(n))
##D y <- beta[, 1] + beta[, 2]*x
##D model <- niqr(fun=fun4, x0=rep(.5, 6), X=cbind(1,x), y=y)
## End(Not run)

# see the documentation for 'summary.piqr', and 'plot.piqr'




