library(SpatialVx)


### Name: hiw
### Title: Spatial Forecast Verification Shape Analysis
### Aliases: hiw distill.hiw plot.hiw print.hiw summary.hiw
### Keywords: misc

### ** Examples


data( "geom000" )
data( "geom001" )
data( "geom004" )
data( "ICPg240Locs" )

hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01, 50.01),
    projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
    field.type = "Geometric Objects Pretending to be Precipitation",
    units = "mm/h", data.name = "ICP Geometric Cases", obs.name = "geom000",
    model.name = "geom001" )

look <- FeatureFinder(hold, do.smooth = FALSE, thresh = 2, min.size = 200)

look <- hiw(look)

distill.hiw(look)

# Actually, you just need to type:
# distill(look)

summary(look)

# Note: procGPA will not allow missing values.

par(mfrow=c(1,2))
plot(look)
plot(look, which = "Xhat")

## Not run: 
##D hold <- make.SpatialVx( geom000, geom004, thresholds = c(0.01, 50.01),
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Geometric Objects Pretending to be Precipitation",
##D     units = "mm/h", data.name = "ICP Geometric Cases", obs.name = "geom000",
##D     model.name = "geom004" )
##D 
##D look <- FeatureFinder(hold, do.smooth = FALSE)
##D 
##D look <- hiw(look)
##D 
##D par(mfrow=c(1,2))
##D plot(look)
##D plot(look, which = "Xhat")
## End(Not run)



