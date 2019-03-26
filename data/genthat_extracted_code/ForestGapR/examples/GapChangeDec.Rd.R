library(ForestGapR)


### Name: GapChangeDec
### Title: Forest Gaps Change Detection
### Aliases: GapChangeDec

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
##D threshold<-10
##D size<-c(1,10^4) # m2
##D 
##D # Detecting forest gaps
##D gaps_cau2012<-getForestGaps(chm_layer=ALS_CHM_CAU_2012, threshold=threshold, size=size)
##D gaps_cau2014<-getForestGaps(chm_layer=ALS_CHM_CAU_2014, threshold=threshold, size=size)
##D 
##D # Detecting forest gaps changes
##D Gap_changes<-GapChangeDec(gap_layer1=gaps_cau2012,gap_layer2=gaps_cau2014)
##D 
##D # Plotting ALS-derived CHM and forest gaps
##D par(mfrow=c(1,3))
##D plot(ALS_CHM_CAU_2012, main="Forest Canopy Gap - 2012", col=viridis(10))
##D plot(gaps_cau2012, add=TRUE, col="red", legend=FALSE)
##D 
##D plot(ALS_CHM_CAU_2014,  main="Forest Canopy Gap - 2014", col=viridis(10))
##D plot(gaps_cau2014, add=TRUE,col="red", legend=FALSE)
##D 
##D plot(ALS_CHM_CAU_2014,main="Forest Gap Changes Detected",col=viridis(10))
##D plot(Gap_changes, add=TRUE, col="orange", legend=FALSE)
## End(Not run)



