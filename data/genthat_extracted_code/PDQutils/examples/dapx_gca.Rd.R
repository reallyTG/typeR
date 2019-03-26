library(PDQutils)


### Name: dapx_gca
### Title: Approximate density and distribution via Gram-Charlier A
###   expansion.
### Aliases: dapx_gca papx_gca
### Keywords: distribution

### ** Examples

# normal distribution:
xvals <- seq(-2,2,length.out=501)
d1 <- dapx_gca(xvals, c(0,1,0,3,0), basis='normal')
d2 <- dnorm(xvals)
# they should match:
d1 - d2

qvals <- seq(-2,2,length.out=501)
p1 <- papx_gca(qvals, c(0,1,0,3,0))
p2 <- pnorm(qvals)
p1 - p2

xvals <- seq(-6,6,length.out=501)
mu <- 2
sigma <- 3
raw.moments <- c(2,13,62,475,3182)
d1 <- dapx_gca(xvals, raw.moments, basis='normal')
d2 <- dnorm(xvals,mean=mu,sd=sigma)
## Not run: 
##D plot(xvals,d1)
##D lines(xvals,d2,col='red')
## End(Not run)
p1 <- papx_gca(xvals, raw.moments, basis='normal')
p2 <- pnorm(xvals,mean=mu,sd=sigma)
## Not run: 
##D plot(xvals,p1)
##D lines(xvals,p2,col='red')
## End(Not run)

# for a one-sided distribution, like the chi-square
chidf <- 30
ords <- seq(1,9)
raw.moments <- exp(ords * log(2) + lgamma((chidf/2) + ords) - lgamma(chidf/2))
xvals <- seq(0.3,10,length.out=501)
d1g <- dapx_gca(xvals, raw.moments, support=c(0,Inf), basis='gamma')
d2 <- dchisq(xvals,df=chidf)
## Not run: 
##D plot(xvals,d1g)
##D lines(xvals,d2,col='red')
## End(Not run)

p1g <- papx_gca(xvals, raw.moments, support=c(0,Inf), basis='gamma')
p2 <- pchisq(xvals,df=chidf)
## Not run: 
##D plot(xvals,p1g)
##D lines(xvals,p2,col='red')
## End(Not run)

# for a one-sided distribution, like the log-normal
mu <- 2
sigma <- 1
ords <- seq(1,8)
raw.moments <- exp(ords * mu + 0.5 * (sigma*ords)^2)
xvals <- seq(0.5,10,length.out=501)
d1g <- dapx_gca(xvals, raw.moments, support=c(0,Inf), basis='gamma')
d2 <- dnorm(log(xvals),mean=mu,sd=sigma) / xvals
## Not run: 
##D 	plot(xvals,d1g)
##D 	lines(xvals,d2,col='red')
## End(Not run)



