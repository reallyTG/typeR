library(SpatialVx)


### Name: spct
### Title: Spatial Prediction Comparison Test
### Aliases: spct
### Keywords: htest models

### ** Examples


## Not run: 
##D y1 <- predict( Tps( fields::ozone$x, fields::ozone$y ) )
##D y2 <- predict( Krig( fields::ozone$x, fields::ozone$y, theta = 20 ) )
##D 
##D y <- fields::ozone$y
##D 
##D spct( abs( y1 - y ) - abs( y2 - y ), loc = fields::ozone$x )
##D 
##D spct( abs( y1 - y ) - abs( runif( 20, 1, 5 ) - y ), loc = fields::ozone$x )
## End(Not run)



