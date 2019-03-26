library(coefplot)


### Name: extract.coef.maxLik
### Title: extract.coef.maxLik
### Aliases: extract.coef.maxLik

### ** Examples

## Not run: 
##D library(maxLik)
##D loglik <- function(param) {
##D  mu <- param[1]
##D  sigma <- param[2]
##D  ll <- -0.5*N*log(2*pi) - N*log(sigma) - sum(0.5*(x - mu)^2/sigma^2)
##D ll
##D }
##D x <- rnorm(1000, 1, 2) # use mean=1, stdd=2
##D N <- length(x)
##D res <- maxLik(loglik, start=c(0,1)) # use 'wrong' start values
##D extract.coef(res)
## End(Not run)




