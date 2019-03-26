library(LPCM)


### Name: coverage
### Title: Coverage and self-coverage plots.
### Aliases: coverage coverage.raw lpc.coverage lpc.self.coverage
###   select.self.coverage
### Keywords: multivariate

### ** Examples

data(gvessel)
## Not run: 
##D gvessel.self <-lpc.self.coverage(gvessel[,c(2,4,5)], x0=c(35, 1870,
##D 6.3), print=FALSE, plot.type=0)
##D h <- select.self.coverage(gvessel.self)$select
##D gvessel.lpc <- lpc(gvessel[,c(2,4,5)], h=h[1],  x0=c(35, 1870, 6.3))
##D lpc.coverage(gvessel.lpc, gridsize=10, print=FALSE)
## End(Not run)

data(calspeedflow)
fitms <- ms(calspeedflow[,3:4])
coverage(fitms$data, fitms$cluster.center)



