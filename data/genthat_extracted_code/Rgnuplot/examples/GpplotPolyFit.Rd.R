library(Rgnuplot)


### Name: GpplotPolyFit
### Title: Plots a polynomial fit in one function call
### Aliases: GpplotPolyFit
### Keywords: programming

### ** Examples

polnorder <- 7# order of the polynomial
npoints <- 20 # number of points to plot
xpoints <- ( 0:npoints ) * 0.1 # x values
wpoints <- c(1,10^ -( 0:polnorder )) # "a" to "h" values
xPower <- outer(xpoints, 0:7, '^')
ypoints <- colSums(wpoints[1:8] * t(xPower))
## Not run: GpplotPolyFit(xpoints, ypoints, 7)



