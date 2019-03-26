library(Flury)


### Name: turtles
### Title: Turtle Carapace measurements (Jolicoeur and Mosimann)
### Aliases: turtles
### Keywords: datasets

### ** Examples

data(turtles)
## Not run: 
##D pairs(turtles[,-1],
##D   lower.panel = function(x, y){ points(x, y,
##D   pch = unclass(turtles[,1]),
##D   col = as.numeric(turtles[,1]))},
##D   main = "Pairwise scatter plots for painted turtles")
## End(Not run)



