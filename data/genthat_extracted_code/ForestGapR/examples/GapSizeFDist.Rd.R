library(ForestGapR)


### Name: GapSizeFDist
### Title: Forest Canopy Gap-size Frequency Distributions
### Aliases: GapSizeFDist

### ** Examples

#Loading raster library
library(raster)

# ALS-derived CHM over Adolpho Ducke Forest Reserve - Brazilian tropical forest
data(ALS_CHM_DUC)

# set height tresholds (e.g. 10 meters)
threshold<-10
size<-c(1,10^4) # m2

# Detecting forest gaps
gaps_duc<-getForestGaps(chm_layer=ALS_CHM_DUC, threshold=threshold, size=size)

# Computing basic statistis of forest gap
gaps_stats<-GapStats(gap_layer=gaps_duc, chm_layer=ALS_CHM_DUC)

# Gap-size Frequency Distributions
GapSizeFDist(gaps_stats=gaps_stats, col="forestgreen", pch=16, cex=1,
axes=FALSE,ylab="Gap Frequency",xlab=as.expression(bquote("Gap Size" ~ (m^2) )))
axis(1);axis(2)
grid(4,4)




