library(SpatialVx)


### Name: pphindcast2d
### Title: Practically Perfect Hindcast Neighborhood Verification Method
### Aliases: pphindcast2d plot.pphindcast2d print.pphindcast2d
### Keywords: math

### ** Examples

x <- y <- matrix( 0, 50, 50)
x[ sample(1:50,10), sample(1:50,10)] <- rexp( 100, 0.25)
y[ sample(1:50,20), sample(1:50,20)] <- rexp( 400)

hold <- make.SpatialVx( x, y, thresholds=c(0.1, 0.5), field.type = "random")
look <- pphindcast2d(hold, levels=c(1, 3))
look
## Not run: 
##D data( "geom001" )
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01, 50.01),
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     data.name = "Geometric", obs.name = "geom000", model.name = "geom001",
##D     field.type = "Precipitation", units = "mm/h")
##D 
##D look <- pphindcast2d( hold, levels=c(1, 3, 65), verbose=TRUE)
##D 
##D plot(look, mfrow = c(1, 2) )
##D plot(look, mfrow = c(1, 2), type = "line")
##D 
##D # Alternatively:
##D par( mfrow = c(1, 2) )
##D hoods2dPlot( look$values, args = attributes( look ),
##D     main="Gilbert Skill Score")
## End(Not run)



