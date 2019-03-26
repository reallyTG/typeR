library(latticeExtra)


### Name: panel.ellipse
### Title: Lattice panel function to fit and draw a confidence ellipsoid
###   from bivariate data.
### Aliases: panel.ellipse
### Keywords: dplot

### ** Examples


xyplot(Sepal.Length ~ Petal.Length, groups=Species,
       data = iris, scales = "free",
       par.settings = list(superpose.symbol = list(pch=c(15:17)),
                           superpose.line = list(lwd=2, lty=1:3)),
       panel = function(x, y, ...) {
           panel.xyplot(x, y, ...)
           panel.ellipse(x, y, ...)
       },
       auto.key = list(x = .1, y = .8, corner = c(0, 0)))

## Without groups
xyplot(Sepal.Length ~ Petal.Length, 
       data = iris, scales = "free",
       par.settings = list(plot.symbol = list(cex = 1.1, pch=16)),
       panel = function(x, y, ...) {
           panel.xyplot(x, y, ...)
           panel.ellipse(x, y, lwd = 2, ...)
       },
       auto.key = list(x = .1, y = .8, corner = c(0, 0)))


## With conditioning
xyplot(Sepal.Length ~ Petal.Length | Species, 
       data = iris, scales = "free",
       par.settings = list(plot.symbol = list(cex = 1.1, pch=16)),
       layout=c(2,2),
       panel = function(x, y, ...) {
           panel.xyplot(x, y, ...)
           panel.ellipse(x, y, lwd = 2, ...)
       },
       auto.key = list(x = .6, y = .8, corner = c(0, 0)))


## Compare classical with robust 
xyplot(Sepal.Length ~ Petal.Length | Species, 
       data = iris, scales = "free",
       par.settings = list(plot.symbol = list(cex = 1.1, pch=16)),
       layout=c(2,2),
       panel = function(x, y, ...) {
           panel.xyplot(x, y, ...)
           panel.ellipse(x, y, lwd = 2, ...)
           panel.ellipse(x, y, lwd = 2, col="red", robust=TRUE,  ...)
       })




