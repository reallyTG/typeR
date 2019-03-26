library(oce)


### Name: colormap
### Title: Calculate color map
### Aliases: colormap

### ** Examples

library(oce)
## Example 1. color scheme for points on xy plot
x <- seq(0, 1, length.out=40)
y <- sin(2 * pi * x)
par(mar=c(3, 3, 1, 1))
mar <- par('mar') # prevent margin creep by drawPalette()
## First, default breaks
c <- colormap(y)
drawPalette(c$zlim, col=c$col, breaks=c$breaks)
plot(x, y, bg=c$zcol, pch=21, cex=1)
grid()
par(mar=mar)
## Second, 100 breaks, yielding a smoother palette
c <- colormap(y, breaks=100)
drawPalette(c$zlim, col=c$col, breaks=c$breaks)
plot(x, y, bg=c$zcol, pch=21, cex=1)
grid()
par(mar=mar)

## Not run: 
##D ## Example 2. topographic image with a standard color scheme
##D par(mfrow=c(1,1))
##D data(topoWorld)
##D cm <- colormap(name="gmt_globe")
##D imagep(topoWorld, breaks=cm$breaks, col=cm$col)
##D 
##D ## Example 3. topographic image with modified colors,
##D ## black for depths below 4km.
##D cm <- colormap(name="gmt_globe")
##D deep <- cm$x0 < -4000
##D cm$col0[deep] <- 'black'
##D cm$col1[deep] <- 'black'
##D cm <- colormap(x0=cm$x0, x1=cm$x1, col0=cm$col0, col1=cm$col1)
##D imagep(topoWorld, breaks=cm$breaks, col=cm$col)
##D 
##D ## Example 4. image of world topography with water colorized
##D ## smoothly from violet at 8km depth to blue
##D ## at 4km depth, then blending in 0.5km increments
##D ## to white at the coast, with tan for land.
##D cm <- colormap(x0=c(-8000, -4000,   0,  100),
##D                x1=c(-4000,     0, 100, 5000),
##D                col0=c("violet","blue","white","tan"),
##D                col1=c("blue","white","tan","yelloe"),
##D                blend=c(100, 8, 0))
##D lon <- topoWorld[['longitude']]
##D lat <- topoWorld[['latitude']]
##D z <- topoWorld[['z']]
##D imagep(lon, lat, z, breaks=cm$breaks, col=cm$col)
##D contour(lon, lat, z, levels=0, add=TRUE)
##D message("colormap() example 4 is broken")
##D 
##D ## Example 5. visualize GMT style color map
##D cm <- colormap(name="gmt_globe", debug=4)
##D plot(seq_along(cm$x0), cm$x0, pch=21, bg=cm$col0)
##D grid()
##D points(seq_along(cm$x1), cm$x1, pch=21, bg=cm$col1)
##D 
##D ## Example 6. colfunction
##D cm <- colormap(c(0, 1))
##D x <- 1:10
##D y <- (x - 5.5)^2
##D z <- seq(0, 1, length.out=length(x))
##D drawPalette(colormap=cm)
##D plot(x, y, pch=21, bg=cm$colfunction(z), cex=3)
## End(Not run)



