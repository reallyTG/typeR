library(hexbin)


### Name: hexpolygon
### Title: Hexagon Coordinates and Polygon Drawing
### Aliases: hexpolygon hexcoords
### Keywords: dplot aplot

### ** Examples

str(hexcoords(1, sep = NA))  # multiple of (6 + 1)
str(hexcoords(1, sep = NULL))# no separator -> multiple of 6
## Don't show: 
stopifnot(3 * (6+1) == sapply(hexcoords(2, n = 3, sep = NA)[1:2], length),
          6 == sapply(hexcoords(1)[1:2], length))
set.seed(1001)
## End(Don't show)

## hexpolygon()s:
x <- runif(20, -2, 2)
y <- x + rnorm(20)

## 1) traditional 'graphics'
plot(x,y, asp = 1, "plot() + hexpolygon()")
hexpolygon(x,y, dx = 0.1, density = 25, col = 2, lwd = 1.5)

## 2) "grid" :

addBit <- function(bnds, f = 0.05) bnds + c(-f, f) * diff(bnds)
sc <- addBit(rxy <- range(x,y))# same extents (cheating asp=1)
library("grid")
grid.newpage()
pushViewport(plotViewport(.1+c(4,4,2,1), xscale = sc, yscale = sc))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
hexpolygon(x,y, hexcoords(dx = 0.1, sep=NULL), border = "blue", fill=NA)
popViewport()



