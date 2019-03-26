library(ForestGapR)


### Name: GapSPDF
### Title: Forest Canopy Gaps as Spatial Polygons
### Aliases: GapSPDF

### ** Examples

## Not run: 
##D #Loading raster and viridis libraries
##D library(raster)
##D library(viridis)
##D 
##D # ALS-derived CHM over Adolpho Ducke Forest Reserve - Brazilian tropical forest
##D data(ALS_CHM_DUC)
##D 
##D # set height thresholds (e.g. 10 meters)
##D threshold<-10
##D size<-c(1,10^4) # m2
##D 
##D # Detecting forest gaps
##D gaps_duc<-getForestGaps(chm_layer=ALS_CHM_DUC, threshold=threshold, size=size)
##D 
##D # Converting raster layer to SpatialPolygonsDataFrame
##D gaps_spdf<-GapSPDF(gap_layer=gaps_duc)
##D 
##D # Plotting ALS-derived CHM and forest gaps
##D plot(ALS_CHM_DUC, col=viridis(10), xlim=c(173025,173125), ylim=c(9673100,96731200))
##D plot(gaps_spdf, add=TRUE, border="red", lwd=2)
##D 
##D # Populating the attribute table of Gaps_spdf with gaps statistics
##D gaps_stats<-GapStats(gap_layer=gaps_duc, chm_layer=ALS_CHM_DUC)
##D gaps_spdf<-merge(gaps_spdf,gaps_stats, by="gap_id")
##D head(gaps_spdf@data)
## End(Not run)



