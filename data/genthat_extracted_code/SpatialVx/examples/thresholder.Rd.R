library(SpatialVx)


### Name: thresholder
### Title: Apply a Threshold to a Field
### Aliases: thresholder thresholder.default thresholder.SpatialVx
### Keywords: manip

### ** Examples


x <- matrix( 12 + rnorm( 100, 10, 10 ), 10, 10 )

par( mfrow = c(2, 2) )
image.plot( thresholder( x, th = 12 ), main = "binary" )

image.plot( thresholder( x, type = "replace.below", th = 12 ),
    main = "replace.below" ) 

image.plot( thresholder( x, th = 12, rule = "<=" ),
    main = "binary with rule <=" )

image.plot( thresholder( x, type = "replace.below", th = 12, rule = "<=" ),
    main = "replace.below with rule <=" )

par( mfrow = c(1,1) )
## Not run: 
##D data("geom000")
##D data("geom004")
##D data("ICPg240Locs")
##D 
##D hold <- make.SpatialVx( geom000, geom004, thresholds = c(0.01, 50.01),
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Geometric Objects Pretending to be Precipitation",
##D     units = "mm/h", data.name = "ICP Geometric Cases", obs.name = "geom000",
##D     model.name = "geom004" )
##D 
##D # Note: th = 1 means threshold = 0.01.
##D look <- thresholder( hold, th = 1 )
##D 
##D image.plot( look$X )
##D contour( look$Xhat, add = TRUE, col = "white" )
##D 
##D # Note: th = 2, means threshold = 50.01
##D look <- thresholder( hold, th = 2 )
##D 
##D image.plot( look$X )
##D contour( look$Xhat, add = TRUE, col = "white" )
##D 
##D look <- thresholder( hold, th = 1, rule = "<" )
##D 
##D image.plot( look$X )
##D contour( look$Xhat, add = TRUE, col = "white" )
## End(Not run)



