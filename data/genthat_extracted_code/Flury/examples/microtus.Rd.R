library(Flury)


### Name: microtus
### Title: Microtus classification (more vole data)
### Aliases: microtus
### Keywords: datasets

### ** Examples

data(microtus)
## Not run: 
##D pairs(microtus[,-1],
##D     lower.panel = function(x, y){ points(x, y,
##D     pch = unclass(microtus[,1]),
##D     col = as.numeric(microtus[,1]))},
##D     main = "Pairwise scatter plots for Microtus data")
## End(Not run)




