library(fastnet)


### Name: metric.distance.apl
### Title: Average Path Length
### Aliases: metric.distance.apl

### ** Examples

## Not run: 
##D ##Default function
##D x <-  net.erdos.renyi.gnp(1000,0.01)
##D metric.distance.apl(x)
##D ##Population APL
##D metric.distance.apl(x, full.apl=TRUE)
##D ##Sampling at 99% level with an error of 10% using 5 cores
##D metric.distance.apl(Network = x, probability=0.99, error=0.1, Cores=5)
## End(Not run)




