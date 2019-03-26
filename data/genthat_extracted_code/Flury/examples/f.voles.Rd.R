library(Flury)


### Name: f.voles
### Title: Female vole data
### Aliases: f.voles
### Keywords: datasets

### ** Examples

data(f.voles)
## Not run: 
##D pairs(f.voles[,-1],
##D     lower.panel = function(x, y){ points(x, y,
##D     pch = unclass(f.voles[,1]),
##D     col = as.numeric(f.voles[,1]))},
##D     main = "Pairwise scatter plots for Female vole data")
## End(Not run)



