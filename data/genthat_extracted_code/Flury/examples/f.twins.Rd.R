library(Flury)


### Name: f.twins
### Title: Female Twins
### Aliases: f.twins
### Keywords: datasets

### ** Examples


data(f.twins)
## Not run: 
##D pairs(f.twins[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(f.twins[,1]),
##D   col = as.numeric(f.twins[,1]))},
##D   main = "Pairwise scatter plots for male twins")
## End(Not run)



