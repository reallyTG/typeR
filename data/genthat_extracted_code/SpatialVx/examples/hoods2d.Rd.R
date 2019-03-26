library(SpatialVx)


### Name: hoods2d
### Title: Neighborhood Verification Statistics for a Gridded Verification
###   Set.
### Aliases: hoods2d plot.hoods2d print.hoods2d
### Keywords: math

### ** Examples

x <- y <- matrix( 0, 50, 50)
x[ sample(1:50,10), sample(1:50,10)] <- rexp( 100, 0.25)
y[ sample(1:50,20), sample(1:50,20)] <- rexp( 400)
hold <- make.SpatialVx( x, y, thresholds = c(0.1, 0.5), field.type = "Random Exp. Var." )
look <- hoods2d( hold, which.methods=c("multi.event", "fss"), levels=c(1, 3, 19))
look
plot(look)

## Not run: 
##D data( "UKobs6" )
##D data( "UKfcst6" )
##D data( "UKloc" )
##D 
##D hold <- make.SpatialVx( UKobs6, UKfcst6, thresholds = c(0.01, 20.01),
##D     projection = TRUE, map = TRUE, loc = UKloc, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Nimrod", obs.name = "Observations 6",
##D     model.name = "Forecast 6" )
##D 
##D hold
##D plot(hold)
##D hist(hold, col="darkblue")
##D 
##D look <- hoods2d(hold, which.methods=c("multi.event", "fss"), 
##D     levels=c(1, 3, 5, 9, 17), verbose=TRUE)
##D plot(look)
##D 
##D data( "geom001" )
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01, 50.01),
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Geometric Objects Pretending to be Precipitation",
##D     units = "mm/h", data.name = "ICP Geometric Cases", obs.name = "geom000",
##D     model.name = "geom001" )
##D 
##D look <- hoods2d(hold, levels=c(1, 3, 9, 17, 33, 65, 129, 257), verbose=TRUE)
##D 
##D plot( look) # Might want to use 'pdf' first.
##D 
##D data( "pert004" )
##D data( "pert000" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, thresholds = c(1, 10, 50),
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D plot(hold)
##D 
##D look <- hoods2d(hold, levels=c(1, 3, 17, 33, 65, 129, 257), verbose=TRUE)
##D plot(look)
##D     
## End(Not run)



