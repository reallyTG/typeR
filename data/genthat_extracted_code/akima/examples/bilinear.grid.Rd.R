library(akima)


### Name: bilinear.grid
### Title: Bilinear Interpolation for Data on a Rectangular grid
### Aliases: bilinear.grid
### Keywords: dplot

### ** Examples

data(akima760)
# interpolate at a grid [0,8]x[0,10]
akima.bil <- bilinear.grid(akima760$x,akima760$y,akima760$z)
zmin <- min(akima.bil$z, na.rm=TRUE)
zmax <- max(akima.bil$z, na.rm=TRUE)
breaks <- pretty(c(zmin,zmax),10)
colors <- heat.colors(length(breaks)-1)
image(akima.bil, breaks=breaks, col=colors)
contour(akima.bil, levels=breaks, add=TRUE)



