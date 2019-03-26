library(qtl)


### Name: ripple
### Title: Compare marker orders
### Aliases: ripple
### Keywords: utilities

### ** Examples

data(badorder)
rip1 <- ripple(badorder, chr=1, window=3)
summary(rip1)

## Not run: 
##D rip2 <- ripple(badorder, chr=1, window=2, method="likelihood")
##D summary(rip2)
## End(Not run)

badorder <- switch.order(badorder, 1, rip1[2,])



