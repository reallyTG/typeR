library(ForestGapR)


### Name: GapStats
### Title: Forest Canopy Gaps Stats
### Aliases: GapStats

### ** Examples

#Loading raster library
library(raster)

# ALS-derived CHM over Adolpho Ducke Forest Reserve - Brazilian tropical forest
data(ALS_CHM_CAU_2012)

# set height thresholds (e.g. 10 meters)
threshold<-10
size<-c(5,10^4) # m2

# Detecting forest gaps
gaps_duc<-getForestGaps(chm_layer=ALS_CHM_DUC, threshold=threshold, size=size)

# Computing basic statistis of forest gap
gaps_stats<-GapStats(gap_layer=gaps_duc, chm_layer=ALS_CHM_DUC)




