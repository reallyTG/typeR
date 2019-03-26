library(Flury)


### Name: apples
### Title: Apple rootstock data
### Aliases: apples
### Keywords: datasets

### ** Examples

data(apples)
## Not run: 
##D pairs(apples[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(apples[,1]),
##D   col = as.numeric(apples[,1]))},
##D   main = "Pairwise scatter plots for apple rootstocks")
## End(Not run)



