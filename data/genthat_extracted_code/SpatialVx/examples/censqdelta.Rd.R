library(SpatialVx)


### Name: censqdelta
### Title: Centered on Square Domain Baddeley's Delta Metric
### Aliases: censqdelta
### Keywords: arith manip

### ** Examples

x <- y <- matrix( 0, 100, 200 )
x[ 45, 10 ] <- 1
x <- kernel2dsmooth( x, kernel.type = "disk", r = 4 )

y[ 50, 60 ] <- 1
y <- kernel2dsmooth( y, kernel.type = "disk", r = 10 )

censqdelta( x, y )

## Not run: 
##D # Example form Gilleland (2017).
##D #
##D # I1 = circle with radius = 20 centered at 100, 100
##D # I2 = circle with radius = 20 centered at 140, 100
##D # I3 = circle with radius = 20 centered at 180, 100
##D # I4 = circle with radius = 20 centered at 140, 140
##D 
##D I1 <- I2 <- I3 <- I4 <- matrix( 0, 200, 200 )
##D 
##D I1[ 100, 100 ] <- 1
##D I1 <- kernel2dsmooth( I1, kernel.type = "disk", r = 20 )
##D I1[ I1 > 0 ] <- 1
##D if( any( I1 < 0 ) ) I1[ I1 < 0 ] <- 0
##D 
##D I2[ 140, 100 ] <- 1
##D I2 <- kernel2dsmooth( I2, kernel.type = "disk", r = 20 )
##D I2[ I2 > 0 ] <- 1
##D if( any( I2 < 0 ) ) I2[ I2 < 0 ] <- 0
##D 
##D I3[ 180, 100 ] <- 1
##D I3 <- kernel2dsmooth( I3, kernel.type = "disk", r = 20 )
##D I3[ I3 > 0 ] <- 1
##D if( any( I3 < 0 ) ) I3[ I3 < 0 ] <- 0
##D 
##D I4[ 140, 140 ] <- 1
##D I4 <- kernel2dsmooth( I4, kernel.type = "disk", r = 20 )
##D I4[ I4 > 0 ] <- 1
##D if( any( I4 < 0 ) ) I4[ I4 < 0 ] <- 0
##D 
##D image( I1, col = c("white", "darkblue") )
##D contour( I2, add = TRUE )
##D contour( I3, add = TRUE )
##D contour( I4, add = TRUE )
##D 
##D # Each circle is the same size and shape, and the domain is square.
##D # I1 and I2, I2 and I3, and I2 and I4 are all the same distance
##D # away from each other.  I1 and I4 and I3 and I4 are also the same distance
##D # from each other.  I3 touches the edge of the domain.
##D # 
##D 
##D # First, calculate the Baddeley delta metric on each 
##D # comparison.
##D 
##D I1im <- as.im( I1 )
##D I2im <- as.im( I2 )
##D I3im <- as.im( I3 )
##D I4im <- as.im( I4 )
##D 
##D I1im <- solutionset( I1im > 0 )
##D I2im <- solutionset( I2im > 0 )
##D I3im <- solutionset( I3im > 0 )
##D I4im <- solutionset( I4im > 0 )
##D 
##D deltametric( I1im, I2im )
##D deltametric( I2im, I3im )
##D deltametric( I2im, I4im )
##D 
##D # Above are all different values.
##D # Below, they are all 28.84478.
##D censqdelta( I1, I2 )
##D censqdelta( I2, I3 )
##D censqdelta( I2, I4 )
##D 
##D # Similarly for I1 and I4 vs I3 and I4.
##D deltametric( I1im, I4im )
##D deltametric( I3im, I4im )
##D 
##D censqdelta( I1, I4 )
##D censqdelta( I3, I4 )
##D 
##D # To see why this problem exists.
##D dm1 <- distmap( I1im )
##D dm1 <- as.matrix( dm1 )
##D dm2 <- distmap( I2im )
##D dm2 <- as.matrix( dm2 )
##D 
##D par( mfrow = c( 2, 2 ) )
##D image.plot( dm1 )
##D contour( I1, add = TRUE, col = "white" )
##D image.plot( dm2 )
##D contour( I2, add = TRUE, col = "white" )
##D 
##D image.plot( abs( dm1 ) - abs( dm2 ) )
##D contour( I1, add = TRUE, col = "white" )
##D contour( I2, add = TRUE, col = "white" )
##D 
## End(Not run)




