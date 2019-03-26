library(SpatialVx)


### Name: imomenter
### Title: Image Moments
### Aliases: imomenter imomenter.im imomenter.matrix print.imomented
### Keywords: manip arith

### ** Examples


look <- matrix(0, 10, 10)

look[3:5, 7:8] <- rnorm(6)

imomenter(look)

## Not run: 
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D imomenter( geom000 )
##D imomenter( geom000, loc = ICPg240Locs )
##D 
##D data( "geom004" )
##D 
##D imomenter( geom004 )
##D 
##D imomenter( geom004, loc = ICPg240Locs )
## End(Not run)




