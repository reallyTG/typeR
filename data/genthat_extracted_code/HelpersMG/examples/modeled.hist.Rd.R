library(HelpersMG)


### Name: modeled.hist
### Title: Return the theoretical value for the histogram bar
### Aliases: modeled.hist

### ** Examples

## Not run: 
##D n <- rnorm(100, mean=10, sd=2)
##D breaks <- 0:20
##D hist(n, breaks=breaks)
##D 
##D s <- modeled.hist(breaks=breaks, FUN=pnorm, mean=10, sd=2, sum=100)
##D 
##D points(s$x, s$y, pch=19)
##D lines(s$x, s$y)
##D 
##D n <- rlnorm(100, meanlog=2, sdlog=0.4)
##D b <- hist(n, ylim=c(0, 70))
##D 
##D s <- modeled.hist(breaks=b$breaks, FUN=plnorm, meanlog=2, sdlog=0.4, sum=100)
##D 
##D points(s$x, s$y, pch=19)
##D lines(s$x, s$y)
## End(Not run)



