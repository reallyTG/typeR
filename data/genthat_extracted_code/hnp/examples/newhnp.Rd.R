library(hnp)


### Name: newhnp
### Title: Method for non-implemented model classes
### Aliases: newhnp
### Keywords: hnp

### ** Examples

## Implementing new classes
## Users provide three functions - diagfun, simfun and fitfun,
## in the following way:
##
## diagfun <- function(obj) {
##   userfunction(obj, other_argumens)
##     # e.g., resid(obj, type="pearson")
##   }
##
## simfun <- function(n, obj) {
##   userfunction(n, other_arguments) # e.g., rpois(n, fitted(obj))
##   }
##
## fitfun <- function(y.) {
##  userfunction(y. ~ linear_predictor, other_arguments, data=data)
##    # e.g., glm(y. ~ block + factor1 * factor2, family=poisson,
##    #           data=mydata)
##  }
##
## when response is binary:
## fitfun <- function(y.) {
##  userfunction(cbind(y., m-y.) ~ linear_predictor,
##               other_arguments, data=data)
##    #e.g., glm(cbind(y., m-y.) ~ treatment - 1,
##    #          family=binomial, data=data)
##  }

## Not run: 
##D ## Example no. 1: Using Cook's distance as a diagnostic measure
##D y <- rpois(30, lambda=rep(c(.5, 1.5, 5), each=10))
##D tr <- gl(3, 10)
##D fit1 <- glm(y ~ tr, family=poisson)
##D 
##D # diagfun
##D d.fun <- function(obj) cooks.distance(obj)
##D 
##D # simfun
##D s.fun <- function(n, obj) {
##D   lam <- fitted(obj)
##D   rpois(n, lambda=lam)
##D }
##D 
##D # fitfun
##D my.data <- data.frame(y, tr)
##D f.fun <- function(y.) glm(y. ~ tr, family=poisson, data=my.data)
##D 
##D # hnp call
##D hnp(fit1, newclass=TRUE, diagfun=d.fun, simfun=s.fun, fitfun=f.fun)
##D 
##D ## Example no. 2: Implementing gamma model using package gamlss
##D # load package
##D require(gamlss)
##D 
##D # model fitting
##D y <- rGA(30, mu=rep(c(.5, 1.5, 5), each=10), sigma=.5)
##D tr <- gl(3, 10)
##D fit2 <- gamlss(y ~ tr, family=GA)
##D 
##D # diagfun
##D d.fun <- function(obj) resid(obj) # this is the default if no
##D                                   # diagfun is provided
##D 
##D # simfun
##D s.fun <- function(n, obj) {
##D   mu <- obj$mu.fv
##D   sig <- obj$sigma.fv
##D   rGA(n, mu=mu, sigma=sig)
##D }
##D 
##D # fitfun
##D my.data <- data.frame(y, tr)
##D f.fun <- function(y.) gamlss(y. ~ tr, family=GA, data=my.data)
##D 
##D # hnp call
##D hnp(fit2, newclass=TRUE, diagfun=d.fun, simfun=s.fun,
##D     fitfun=f.fun, data=data.frame(y, tr))
##D 
##D ## Example no. 3: Implementing binomial model in gamlss
##D # model fitting
##D y <- rBI(30, bd=50, mu=rep(c(.2, .5, .9), each=10))
##D m <- 50
##D tr <- gl(3, 10)
##D fit3 <- gamlss(cbind(y, m-y) ~ tr, family=BI)
##D 
##D # diagfun
##D d.fun <- function(obj) resid(obj)
##D 
##D # simfun
##D s.fun <- function(n, obj) {
##D   mu <- obj$mu.fv
##D   bd <- obj$bd
##D   rBI(n, bd=bd, mu=mu)
##D }
##D 
##D # fitfun
##D my.data <- data.frame(y, tr, m)
##D f.fun <- function(y.) gamlss(cbind(y., m-y.) ~ tr,
##D                                family=BI, data=my.data)
##D 
##D # hnp call
##D hnp(fit3, newclass=TRUE, diagfun=d.fun, simfun=s.fun, fitfun=f.fun)
## End(Not run)



