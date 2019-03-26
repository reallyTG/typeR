library(SpatialVx)


### Name: hoods2dPlot
### Title: Quilt Plot and a Matrix Plot.
### Aliases: hoods2dPlot
### Keywords: hplot

### ** Examples

x <- y <- matrix( 0, 50, 50)
x[ sample(1:50,10), sample(1:50,10)] <- rexp( 100, 0.25)
y[ sample(1:50,20), sample(1:50,20)] <- rexp( 400)

hold <- make.SpatialVx(x, y, thresholds=c(0.1, 0.5), field.type="random")

look <- hoods2d(hold, which.methods=c("multi.event", "fss"),
    levels=c(1, 3, 20))

hoods2dPlot( look$multi.event$hk, args=hold,
    main="Hanssen Kuipers Score (Multi-Event Cont. Table)")
## Not run: 
##D data( "geom001" )
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01, 50.01),
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Geometric ICP Test Cases", obs.name = "geom000",
##D     model.name = "geom001" )
##D 
##D look <- hoods2d(hold, levels=c(1, 3, 5, 17, 33, 65), verbose=TRUE)
##D par(mfrow=c(1,2))
##D hoods2dPlot(look$pragmatic$bss, args=attributes(hold))
## End(Not run)



