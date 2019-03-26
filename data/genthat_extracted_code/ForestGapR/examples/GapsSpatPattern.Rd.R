library(ForestGapR)


### Name: GapsSpatPattern
### Title: Spatial Pattern Analysis of Forest Canopy Gaps
### Aliases: GapsSpatPattern

### ** Examples

## Not run: 
##D #Loading raster and viridis libraries
##D library(raster)
##D library(viridis)
##D 
##D # ALS-derived CHM from Fazenda Cauxi - Brazilian tropical forest
##D data(ALS_CHM_CAU_2012)
##D data(ALS_CHM_CAU_2014)
##D 
##D # set height thresholds (e.g. 10 meters)
##D threshold <- 10
##D size <- c(1,1000) # m2
##D 
##D # Detecting forest gaps
##D gaps_cau2012 <- getForestGaps(chm_layer = ALS_CHM_CAU_2012, threshold=threshold, size=size)
##D gaps_cau2014 <- getForestGaps(chm_layer = ALS_CHM_CAU_2014, threshold=threshold, size=size)
##D 
##D # Converting raster layers to SpatialPolygonsDataFrame
##D gaps_cau2012_spdf <- GapSPDF(gap_layer = gaps_cau2012)
##D gaps_cau2014_spdf <- GapSPDF(gap_layer = gaps_cau2014)
##D 
##D # Spatial pattern analysis of each year
##D gaps_cau2012_SpatPattern <- GapsSpatPattern(gaps_cau2012_spdf, ALS_CHM_CAU_2012)
##D gaps_cau2014_SpatPattern <- GapsSpatPattern(gaps_cau2014_spdf, ALS_CHM_CAU_2014)
## End(Not run)



