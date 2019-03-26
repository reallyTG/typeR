library(fMultivar)


### Name: zzz-mvt
### Title: Multivariate Student-t Distribution
### Keywords: math

### ** Examples

## Not run: 
##D ## Load Libray:
##D    require(mvtnorm)
##D    
##D ## dmvt - 
##D    # basic evaluation
##D    dmvt(x = c(0,0), sigma = diag(2))
##D 
##D ## dmvt | dmvnorm - 
##D    # check behavior for df=0 and df=Inf
##D    x <- c(1.23, 4.56)
##D    mu <- 1:2
##D    Sigma <- diag(2)
##D    x0 <- dmvt(x, delta = mu, sigma = Sigma, df = 0) # default log = TRUE!
##D    x8 <- dmvt(x, delta = mu, sigma = Sigma, df = Inf) # default log = TRUE!
##D    xn <- dmvnorm(x, mean = mu, sigma = Sigma, log = TRUE)
##D    stopifnot(identical(x0, x8), identical(x0, xn))
##D 
##D ## rmvt -
##D    # X ~ t_3(0, diag(2))
##D    x <- rmvt(100, sigma = diag(2), df = 3) # t_3(0, diag(2)) sample
##D    plot(x)
##D 
##D ## rmvt -
##D    # X ~ t_3(mu, Sigma)
##D    n <- 1000
##D    mu <- 1:2
##D    Sigma <- matrix(c(4, 2, 2, 3), ncol=2)
##D    set.seed(271)
##D    x <- rep(mu, each=n) + rmvt(n, sigma=Sigma, df=3)
##D    plot(x)
##D 
##D ## rmvt -
##D    # Note that the call rmvt(n, mean=mu, sigma=Sigma, df=3) does *not*
##D    # give a valid sample from t_3(mu, Sigma)! [and thus throws an error]
##D    try(rmvt(n, mean=mu, sigma=Sigma, df=3))
##D 
##D ## rmvnorm - 
##D    # df=Inf correctly samples from a multivariate normal distribution
##D    set.seed(271)
##D    x <- rep(mu, each=n) + rmvt(n, sigma=Sigma, df=Inf)
##D    set.seed(271)
##D    x. <- rmvnorm(n, mean=mu, sigma=Sigma)
##D    stopifnot(identical(x, x.))
## End(Not run)



