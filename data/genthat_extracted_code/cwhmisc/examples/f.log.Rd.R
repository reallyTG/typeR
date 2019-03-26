library(cwhmisc)


### Name: f.log
### Title: Determine an optimized offset s and return log10(data+s).
### Aliases: f.log
### Keywords: distribution

### ** Examples

  x <- c(rep(0,20), exp(rnorm(1000,0.05)))
  fx <- f.log(x)
 ## Not run: 
##D   oldpar <- par(mfrow = c(2, 3))
##D   plot(x,main="exp(normal)+zeros")
##D   qqnorm(x)
##D   T3plot(x)
##D   plot(fx,main="optimized offset")
##D   qqnorm(fx)
##D   T3plot(fx)
##D   par(oldpar)
##D  
## End(Not run)



