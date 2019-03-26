library(LPCM)


### Name: unscale
### Title: Unscaling local principal objects.
### Aliases: unscale unscale.lpc unscale.lpc.spline unscale.ms
### Keywords: multivariate

### ** Examples

data(gvessel)
unscale(lpc(gvessel[,c(2,4,5)],  h=0.11,  x0=c(35, 1870, 6.3)) )




