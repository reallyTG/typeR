library(SPOT)


### Name: plotFunction
### Title: Surface plot of a function
### Aliases: plotFunction

### ** Examples

plotFunction(function(x){rowSums(x^2)},c(-5,0),c(10,15))
plotFunction(function(x){rowSums(x^2)},c(-5,0),c(10,15),type="contour")
plotFunction(function(x){rowSums(x^2)},c(-5,0),c(10,15),type="persp")




