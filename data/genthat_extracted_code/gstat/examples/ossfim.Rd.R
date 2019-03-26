library(gstat)


### Name: ossfim
### Title: Kriging standard errors as function of grid spacing and block
###   size
### Aliases: ossfim
### Keywords: models

### ** Examples

## Not run: 
##D x <- ossfim(1:15,1:15, model = vgm(1,"Exp",15))
##D library(lattice)
##D levelplot(kriging.se~spacing+block.size, x, 
##D   main = "Ossfim results, variogram 1 Exp(15)")
## End(Not run)
# if you wonder about the decrease in the upper left corner of the graph,
# try the above with nmax set to 100, or perhaps 200.



