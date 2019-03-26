library(robustloggamma)


### Name: loggammacenslmrob
### Title: Robust estimation of an Accelerated Failure Time model with
###   extended Log Gamma errors in presence of censored observations.
### Aliases: loggammacenslmrob
### Keywords: robust models

### ** Examples

  ## Not run: 
##D     n <- 50
##D     p <- 2
##D     set.seed(1234)
##D     X <- matrix(rnorm(p*n, sd=2), ncol=p)
##D     mu <- 2
##D     beta <- rep(2,p)
##D     sigma <- 2
##D     lambda <- 1
##D     linear <- mu + X##D 
##D     y <- rloggamma(n=n, mu=linear, sigma=sigma, lambda=lambda)
##D     cens <- rloggamma(n=n, mu=linear+3, sigma=sigma, lambda=lambda)
##D     delta <- as.numeric(y <= cens)
##D     y[delta==0] <- cens[delta==0]
##D     x <- data.frame(y=as.vector(y), x1=X[,1], x2=X[,2])
##D     res <- loggammacenslmrob(y~x1+x2, delta=delta, data=x)
##D     summary(res)
##D   
## End(Not run)



