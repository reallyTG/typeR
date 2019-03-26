library(chebpol)


### Name: chebappxg
### Title: Interpolation on a non-Chebyshev grid
### Aliases: chebappxg chebappxgf
### Keywords: internal

### ** Examples

## Not run: 
##D ## evenly spaced grid-points
##D su <- seq(0,1,length.out=10)
##D ## irregularly spaced grid-points
##D s <- su^3
##D ## create approximation on the irregularly spaced grid
##D ch <- Vectorize(chebappxg(exp(s),list(s)))
##D ## test it:
##D ch(su) - exp(su)
##D # try one with three variables
##D f <- function(x) exp(-sum(x^2))
##D grid <- list(s,su,su^2)
##D ch2 <- chebappxg(evalongrid(f,grid=grid),grid)
##D # test it at 10 random points
##D replicate(10,{a<-runif(3); ch2(a)-f(a)})
##D 
##D # Try Runge's function on a uniformly spaced grid.
##D # Ordinary polynomial fitting of high degree of Runge's function on a uniform grid
##D # creates large oscillations near the end of the interval. Not so with chebappxgf
##D f <- function(x) 1/(1+25*x^2)
##D chg <- Vectorize(chebappxgf(f,seq(-1,1,length.out=15)))
##D # also compare with Chebyshev interpolation
##D ch <- Vectorize(chebappxf(f,15))
##D \dontrun{
##D  # plot it
##D  s <- seq(-1,1,length.out=200)
##D  plot(s, f(s), type='l', col='black')
##D  lines(s, chg(s), col='blue')
##D  lines(s, ch(s), col='red')
##D  legend('topright',
##D         legend=c('Runge function','chebappxg on uniform grid','Chebyshev'),
##D         col=c('black','blue','red'), lty=1)
##D }
## End(Not run)




