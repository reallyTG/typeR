library(qtl)


### Name: reduce2grid
### Title: Reduce to a grid of pseudomarkers.
### Aliases: reduce2grid
### Keywords: utilities

### ** Examples

data(hyper)
hyper <- calc.genoprob(hyper, step=2)
hypersub <- reduce2grid(hyper)

## Not run: 
##D out <- scanone(hypersub)
##D plot(out, incl.markers=FALSE)
## End(Not run)



