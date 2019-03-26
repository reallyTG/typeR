library(Flury)


### Name: m.twins
### Title: Male Twins
### Aliases: m.twins
### Keywords: datasets

### ** Examples

data(m.twins)
## Not run: 
##D pairs(m.twins[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(m.twins[,1]),
##D   col = as.numeric(m.twins[,1]))},
##D   main = "Pairwise scatter plots for male twins")
## End(Not run)



