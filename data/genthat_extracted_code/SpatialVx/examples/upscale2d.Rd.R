library(SpatialVx)


### Name: upscale2d
### Title: Upscaling Neighborhood Verification on a 2-d Verification Set
### Aliases: upscale2d plot.upscale2d print.upscale2d
### Keywords: math

### ** Examples

x <- matrix( 0, 50, 50)
x[ sample(1:50,10), sample(1:50,10)] <- rexp( 100, 0.25)
y <- kernel2dsmooth( x, kernel.type="disk", r=6.5)
x <- kernel2dsmooth( x, kernel.type="gauss", nx=50, ny=50, sigma=3.5)

hold <- make.SpatialVx( x, y, thresholds = seq(0.01,1,,5), field.type = "random")

look <- upscale2d( hold, levels=c(1, 3, 20) )
look

par( mfrow = c(4, 2 ) )
plot( look )

## Not run: 
##D data( "geom001" )
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01, 50.01),
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Geometric", obs.name = "geom000", model.name = "geom001" )
##D 
##D look <- upscale2d(hold, levels=c(1, 3, 9, 17, 33, 65, 129, 257),
##D     verbose=TRUE)
##D 
##D par( mfrow = c(4, 2 ) )
##D 
##D plot(look )
##D look <- upscale2d(hold, q.gt.zero=TRUE, verbose=TRUE)
##D plot(look)
##D look <- upscale2d(hold, verbose=TRUE)
##D plot(look)
##D 
## End(Not run)



