library(SpatialVx)


### Name: LocSig
### Title: Temporal Block Bootstrap Keeping Locations in Space Constant
### Aliases: LocSig plot.LocSig
### Keywords: distribution univar htest nonparametric

### ** Examples

## Not run: 
##D data( "GFSNAMfcstEx" )
##D data( "GFSNAMobsEx" )
##D data( "GFSNAMlocEx" )
##D 
##D id <- GFSNAMlocEx[,"Lon"] >=-90 & GFSNAMlocEx[,"Lon"] <= -75 & GFSNAMlocEx[,"Lat"] <= 40
##D 
##D look <- LocSig(GFSNAMfcstEx[,id] - GFSNAMobsEx[,id], numrep=500)
##D 
##D stats(look)
##D 
##D plot(look, loc = GFSNAMlocEx[ id, ] )
## End(Not run)



