library(aqfig)


### Name: vertical.image.legend
### Title: Put color bar legend in the right plot margin.
### Aliases: vertical.image.legend
### Keywords: color aplot

### ** Examples

## Plot ozone at each location using colors from rainbow.colors
## and differently-sized points.  Add a legend using function
## vertical.image.legend (included in this package).
data(ozone1)
col.rng <- rev(rainbow(n=10, start=0, end=4/6))
z.rng <- c(40, 90)
plot3d.points(x=ozone1$longitude, y=ozone1$latitude, z=ozone1$daily.max,
              xlab="longitude", ylab="latitude", zlim=z.rng, col=col.rng,
              cex.min=0.5, cex.max=1.5)
## To verify, label the points with their concentrations.
text(ozone1$longitude, ozone1$latitude+0.15, ozone1$daily.max, cex=0.7)
## If maps package is available, put on state lines.
if (require("maps"))  map("state", add=TRUE, col="lightgray")
## Put on legend.
vertical.image.legend(col=col.rng, zlim=z.rng)



