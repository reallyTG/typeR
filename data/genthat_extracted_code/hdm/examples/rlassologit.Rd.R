library(hdm)


### Name: rlassologit
### Title: rlassologit: Function for logistic Lasso estimation
### Aliases: rlassologit rlassologit.character rlassologit.default
###   rlassologit.formula
### Keywords: lasso logistic regression

### ** Examples

## Not run: 
##D library(hdm)
##D ## DGP
##D set.seed(2)
##D n <- 250
##D p <- 100
##D px <- 10
##D X <- matrix(rnorm(n*p), ncol=p)
##D beta <- c(rep(2,px), rep(0,p-px))
##D intercept <- 1
##D P <- exp(intercept + X %*% beta)/(1+exp(intercept + X %*% beta))
##D y <- rbinom(length(y), size=1, prob=P)
##D ## fit rlassologit object
##D rlassologit.reg <- rlassologit(y~X)
##D ## methods
##D summary(rlassologit.reg, all=F)
##D print(rlassologit.reg)
##D predict(rlassologit.reg, type='response')
##D X3 <- matrix(rnorm(n*p), ncol=p)
##D predict(rlassologit.reg, newdata=X3)
## End(Not run)



