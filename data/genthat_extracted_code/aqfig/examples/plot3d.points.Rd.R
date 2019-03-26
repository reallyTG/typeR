library(aqfig)


### Name: plot3d.points
### Title: Make 3-D scatterplot (using colored or differently-sized points)
### Aliases: plot3d.points
### Keywords: hplot

### ** Examples


## Plot ozone at each location using colors from rainbow.colors
## and differently-sized points.  Add a legend using function
## vertical.image.legend (included in this package).
data(ozone1)
col.rng <- rev(rainbow(n=10, start=0, end=4/6))
z.rng <- c(40, 90)
plot3d.points(x=ozone1$longitude, y=ozone1$latitude, z=ozone1$daily.max,
              xlab="longitude", ylab="latitude", col=col.rng,
              zlim=z.rng, cex.min=0.5, cex.max=1.5)
## To verify, label the points with their concentrations.
text(ozone1$longitude, ozone1$latitude+0.15, ozone1$daily.max, cex=0.7)
## If maps package is available, put on state lines.
if (require("maps"))  map("state", add=TRUE, col="lightgray")
## Put on legend.
vertical.image.legend(col=col.rng, zlim=z.rng)


## Plot second day of ozone data.  Note that day 2 experienced a smaller
## range of concentrations, so we plot day 2 on same scale as day 1.
data(ozone1)
data(ozone2)
z.rng <- c(40, 90)
col.rng <- rev(rainbow(n=10, start=0, end=4/6))
dev.new()
plot3d.points(x=ozone2$longitude, y=ozone2$latitude, z=ozone2$daily.max,
              xlab="longitude", ylab="latitude", col=col.rng,
              zlim=z.rng, cex.min=0.5, cex.max=1.5)
## To verify, label the points with their concentrations.
text(ozone2$longitude, ozone2$latitude+0.15, ozone2$daily.max, cex=0.7)
## If maps package is available, put on state lines.
if (require("maps"))  map("state", add=TRUE, col="lightgray")
vertical.image.legend(col=col.rng, zlim=z.rng)



## When some z value(s) is/are much lower/higher than the others,
## the outlying value(s) may appear in color at the extent
## of the range, with the remainder of the data clustered in one (or
## just a few) color bin(s).
x <- 1:9
y <- 1:9
z <- c(0, 47:53, 100)
dev.new()
par(mfrow=c(1,3))
col.rng <- rev(rainbow(n=7, start=0, end=4/6))
plot3d.points(x, y, z, col=col.rng)
text(x, y+0.2, z, cex=0.8)
## In vain, you might try to "fix" this by setting zlim so that the
## color range reflects the main portion of the z values.  You may
## assume that the outlying value(s) will show up in the extreme edges
## of the color range, but what will actually happen is that the
## outlying values won't be plotted.
plot3d.points(x, y, z, col=col.rng, zlim=c(47, 53))
text(x, y+0.2, z, cex=0.8)
## Instead, specify zlim to reflect the main porition of the z values,
## and set plt.beyond.zlim=TRUE.  Now, z values below zlim[1] will be
## plotted in the same color as zlim[1]; those above zlim[2] will be
## plotted like z values of zlim[2].  But, remember, now there are
## outlying values whose maginitudes cannot be easily ascertained!
plot3d.points(x, y, z, zlim=c(47, 53), col=col.rng, plt.beyond.zlim=TRUE)
text(x, y+0.2, z, cex=0.8)



