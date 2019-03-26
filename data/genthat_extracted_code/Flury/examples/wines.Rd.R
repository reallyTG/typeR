library(Flury)


### Name: wines
### Title: Chemical composition of wines
### Aliases: wines
### Keywords: datasets

### ** Examples

data(wines)
## Not run: 
##D pairs(wines[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(wines[,1]),
##D   col = as.numeric(wines[,1]))},
##D   main = "Pairwise scatter plots for Marais wine data")
##D ## rather congested scatter plots!
## End(Not run)



