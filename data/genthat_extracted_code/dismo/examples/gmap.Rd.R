library(dismo)


### Name: gmap
### Title: Get a Google map
### Aliases: gmap Mercator
### Keywords: spatial

### ** Examples

## Not run: 
##D library(rgdal)
##D 
##D # get a map using names
##D g = gmap('Australia')
##D plot(g, inter=TRUE)
##D gs = gmap('Sydney, New South Wales, Australia', type='satellite')
##D plot(gs, inter=TRUE)
##D gs = gmap('Sydney, Australia', type='satellite', exp=3)
##D plot(gs, inter=TRUE)
##D gs = gmap('Sydney, Australia', type='hybrid', zoom=10, scale=2)
##D plot(gs, inter=TRUE)
##D 
##D # from a maxtrix with lon/lat points
##D x = runif(30)*10 + 40
##D y = runif(30)*10 - 20
##D xy = cbind(x, y)
##D g = gmap(xy, type='hybrid')
##D plot(g, inter=TRUE)
##D points(Mercator(xy) , col='red', pch=20)
##D 
##D # or from an Extent object
##D e = extent( -121.9531 , -120.3897 , 35.36 , 36.61956 )
##D # you can also get an Extent object by clicking on the map twice after using:
##D # drawExtent()
##D r = gmap(e)
##D plot(r, interpolate=TRUE)
##D 
##D # transform points to Mercator for plotting on top of map:
##D pt <- matrix(c(-121, 36), ncol=2)
##D ptm <- Mercator(pt)
##D points(ptm, cex=3, pch=20, col='blue')
##D Mercator(ptm, inverse=TRUE)
##D 
##D # transform Spatial objects to Mercator for plotting on top of map
##D # here for points, but particularly relevant for lines and polygons
##D pt <- data.frame(pt)
##D coordinates(pt) <- ~X1 + X2
##D proj4string(pt) <-"+proj=longlat +datum=WGS84 +ellps=WGS84"
##D ptm2 <- spTransform(pt, CRS("+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 
##D       +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs"))
##D points(ptm, col='red', pch='x', cex=3)
##D 
##D # styles:
##D g <- gmap("Brooklyn", style="feature:road.local|element:geometry|hue:0x00ff00|saturation:100
##D   &style=feature:landscape|element:geometry|lightness:-100", type='roadmap')
##D plot(g)
## End(Not run)



