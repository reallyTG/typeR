library(Flury)


### Name: electrode
### Title: Electrode Manufacture
### Aliases: electrode
### Keywords: datasets

### ** Examples

data(electrode)
## Not run: 
##D pairs(apply(electrode[,-1], 2, jitter, 2),
##D     lower.panel = function(x, y){ points(x, y,
##D     pch = unclass(electrode[,1]),
##D     col = as.numeric(electrode[,1]))},
##D     main = "Pairwise scatter plots for Electrode data")
## End(Not run)



