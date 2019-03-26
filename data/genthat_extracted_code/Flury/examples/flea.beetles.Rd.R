library(Flury)


### Name: flea.beetles
### Title: Flea Beetles data
### Aliases: flea.beetles
### Keywords: datasets

### ** Examples

data(flea.beetles)
## Not run: 
##D pairs(flea.beetles[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(flea.beetles[,1]),
##D   col = unclass(flea.beetles[,1]))},
##D   main = "Pairwise scatter plots for Lubischew's Flea Beetle data")
## End(Not run)


