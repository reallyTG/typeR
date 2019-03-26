library(hexbin)


### Name: optShape
### Title: Optimal Shape Parameter for Hexbin Viewport
### Aliases: optShape
### Keywords: dplot

### ** Examples

x <- rgamma(10000,.9)
m <- as.logical(rbinom(10000,1,.17))
x[m] <- -x[m]
y <- rnorm(x,abs(x))
library("grid")
vp <- plotViewport(xscale= range(x)+c(-.5,.5),
                   yscale= range(y)+c(-.5,.5),
             default.units = "native")
grid.newpage()
pushViewport(vp)
grid.rect()
shape <- optShape(vp)
shape
hb <- hexbin(x,y,xbins=40,shape=shape)
grid.hexagons(hb,colramp=BTY)



