library(akima)


### Name: bicubic.grid
### Title: Bicubic Interpolation for Data on a Rectangular grid
### Aliases: bicubic.grid
### Keywords: dplot

### ** Examples

data(akima760)
# interpolate at a grid [0,8]x[0,10]
akima.bic <- bicubic.grid(akima760$x,akima760$y,akima760$z)
zmin <- min(akima.bic$z, na.rm=TRUE)
zmax <- max(akima.bic$z, na.rm=TRUE)
breaks <- pretty(c(zmin,zmax),10)
colors <- heat.colors(length(breaks)-1)
image(akima.bic, breaks=breaks, col=colors)
contour(akima.bic, levels=breaks,  add=TRUE)



