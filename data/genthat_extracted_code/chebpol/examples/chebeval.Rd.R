library(chebpol)


### Name: chebeval
### Title: Evaluate a Chebyshev interpolation in a point
### Aliases: chebeval

### ** Examples


# make a function which is known to be unsuitable for Chebyshev approximation
f <- function(x) sign(x)
# make a standard Chebyshev interpolation
ch <- ipol(f,dims=50,method='chebyshev')
# then do a truncated interpolation
val <- evalongrid(f,50)
coef <- chebcoef(val)
# truncate the high frequencies
coef[-(1:10)] <- 0
# make a truncated approximation
tch <- Vectorize(function(x) chebeval(x,coef))
# make a lower degree also
ch2 <- ipol(f,dims=10,method='chebyshev')
# plot the functions
## Not run: 
##D s <- seq(-1,1,length.out=400)
##D plot(s,ch(s),col='red',type='l')
##D lines(s,tch(s),col='blue')
##D lines(s,f(s))
##D lines(s,ch2(s),col='green')
## End(Not run)




