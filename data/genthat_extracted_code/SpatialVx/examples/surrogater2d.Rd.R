library(SpatialVx)


### Name: surrogater2d
### Title: Create Surrogate Fields
### Aliases: surrogater2d aaft2d fft2d mae
### Keywords: math manip

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx

z <- surrogater2d( x, zero.down=FALSE, n=3)

## Not run: 
##D par( mfrow=c(2,2))
##D image.plot( look)
##D image.plot( look2[,,1])
##D image.plot( look2[,,2])
##D image.plot( look2[,,3])
##D 
##D data( pert000)
##D tmp <- surrogater( pert000, n=10, verbose=TRUE)
##D boxplot( cbind( c(pert000), apply( tmp, 3, c)))
##D   
## End(Not run)



