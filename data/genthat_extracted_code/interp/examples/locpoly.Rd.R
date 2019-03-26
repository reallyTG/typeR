library(interp)


### Name: locpoly
### Title: Local polynomial fit.
### Aliases: locpoly
### Keywords: models regression

### ** Examples


## choose a kernel
knl <- "gaussian"

## choose global and local bandwidth 
bwg <- 0.25 # *100% of x- y-range
bwl <- 0.1  # *100% of data set

## a bivariate polynomial of degree 5:
f <- function(x,y) 0.1+ 0.2*x-0.3*y+0.1*x*y+0.3*x^2*y-0.5*y^2*x+y^3*x^2+0.1*y^5

## degree of model
dg=3 

## part 1:
## regular gridded data:
ng<- 21 # x/y size of a square data grid

## build and fill the grid with the theoretical values:

xg<-seq(0,1,length=ng)
yg<-seq(0,1,length=ng)

# xg and yg as matrix matching fg
nx <- length(xg)
ny <- length(yg)
xx <- t(matrix(rep(xg,ny),nx,ny))
yy <- matrix(rep(yg,nx),ny,nx)

fg   <- outer(xg,yg,f)

## local polynomial estimate
## global bw:
ttg <- system.time(pdg <- locpoly(xg,yg,fg,
  input="grid", pd="all", h=c(bwg,bwg), solver="QR", degree=dg, kernel=knl))
## time used:
ttg

## local bw:
ttl <- system.time(pdl <- locpoly(xg,yg,fg,
  input="grid", pd="all", h=bwl, solver="QR", degree=dg, kernel=knl))
## time used:
ttl

image(pdg$x,pdg$y,pdg$z)
contour(pdl$x,pdl$y,pdl$zx,add=TRUE,lty="dotted")
contour(pdl$x,pdl$y,pdl$zy,add=TRUE,lty="dashed")
points(xx,yy,pch=".")


## part 2:
## irregular data,
## results will not be as good as with the regular 21*21=231 points.

nd<- 41 # size of data set

## random irregular data
oldseed <- set.seed(42)
x<-runif(ng)
y<-runif(ng)
set.seed(oldseed)

z <- f(x,y)

## global bw:
ttg <- system.time(pdg <- interp::locpoly(x,y,z, xg,yg, pd="all",
  h=c(bwg,bwg), solver="QR", degree=dg,kernel=knl))

ttg

## local bw:
ttl <- system.time(pdl <- interp::locpoly(x,y,z, xg,yg, pd="all",
  h=bwl, solver="QR", degree=dg,kernel=knl))

ttl

image(pdg$x,pdg$y,pdg$z)
contour(pdl$x,pdl$y,pdl$zx,add=TRUE,lty="dotted")
contour(pdl$x,pdl$y,pdl$zy,add=TRUE,lty="dashed")
points(x,y,pch=".")




