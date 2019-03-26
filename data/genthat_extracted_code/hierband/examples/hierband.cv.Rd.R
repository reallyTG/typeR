library(hierband)


### Name: hierband.cv
### Title: Performs nfolds-cross validation
### Aliases: hierband.cv

### ** Examples

set.seed(123)
p <- 100
n <- 50
K <- 10
true <- ma(p, K)
x <- matrix(rnorm(n*p), n, p) %*% true$A
Sighat <- cov(x)
path <- hierband.path(Sighat)
cv <- hierband.cv(path, x)
fit <- hierband(Sighat, lam=cv$lam.best)
## Not run: 
##D plot(cv$m, main="CV Frob Error", type="b")
##D lines(cv$m+cv$se, main="CV Frob Error")
##D lines(cv$m-cv$se, main="CV Frob Error")
##D abline(v=c(cv$ibest,cv$i.1se.rule), lty=2)
## End(Not run)



