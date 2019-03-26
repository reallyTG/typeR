library(qtl)


### Name: summary.ripple
### Title: Print summary of ripple results
### Aliases: summary.ripple
### Keywords: print

### ** Examples
 
## Not run: 
##D data(badorder)
##D rip1 <- ripple(badorder, 1, 7)
##D summary(rip1)
##D 
##D rip2 <- ripple(badorder, 1, 2, method="likelihood")
##D summary(rip2)
##D 
##D badorder <- switch.order(badorder, 1, rip2[2,])
## End(Not run)


