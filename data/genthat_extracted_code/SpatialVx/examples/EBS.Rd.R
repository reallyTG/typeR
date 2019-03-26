library(SpatialVx)


### Name: EBS
### Title: Elmore, Baldwin and Schultz Method for Field Significance for
###   Spatial Bias Errors
### Aliases: EBS plot.EBS
### Keywords: htest nonparametric spatial ts

### ** Examples

data( "GFSNAMfcstEx" )
data( "GFSNAMobsEx" )
data( "GFSNAMlocEx" )

id <- GFSNAMlocEx[,"Lon"] >=-95
id <- id & GFSNAMlocEx[,"Lon"] <= -75
id <- id & GFSNAMlocEx[,"Lat"] <= 32

##
## This next step is a bit awkward, but these data
## are not in the format of the SpatialVx class.
## These are being set up with arbitrarily chosen
## dimensions (49 X 48) for the spatial part.  It
## won't matter to the analyses or plots.
##
Vx <- GFSNAMobsEx
Fcst <- GFSNAMfcstEx
Ref <- array(t(Vx), dim=c(49, 48, 361))
Mod <- array(t(Fcst), dim=c(49, 48, 361)) 

hold <- make.SpatialVx(Ref, Mod, loc=GFSNAMlocEx,
    projection=TRUE, map=TRUE, loc.byrow = TRUE, subset=id,
    field.type="Precipitation", units="mm",
    data.name = "GFS/NAM", obs.name = "Reference", model.name = "Model" )

look <- EBS(hold, bootR=500, ntrials=500, verbose=TRUE)
plot( look )

## Not run: 
##D # Same as above, but now we'll do it for all points.
##D # A little slower, but not terribly bad.
##D 
##D hold <- make.SpatialVx(Ref, Mod, loc = GFSNAMlocEx,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", reg.grid = FALSE, units = "mm",
##D     data.name = "GFS/NAM", obs.name = "Reference", model.name = "Model" )
##D 
##D look <- EBS(hold, bootR=500, ntrials=500, verbose=TRUE)
##D plot( look )
## End(Not run)



