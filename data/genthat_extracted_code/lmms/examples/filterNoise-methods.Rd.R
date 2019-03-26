library(lmms)


### Name: filterNoise
### Title: Filter non-informative trajectories
### Aliases: filterNoise
###   filterNoise,matrixOrframe,noise,missingOrnumeric,missingOrnumeric,missingOrnumeric,missingOrnumeric-method

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D G1 <- kidneySimTimeGroup$group=="G1"
##D noiseTest <-investNoise(data=kidneySimTimeGroup$data[G1,],time=kidneySimTimeGroup$time[G1],
##D             sampleID=kidneySimTimeGroup$sampleID[G1])
##D data <-filterNoise(data=kidneySimTimeGroup$data[G1,],noise=noiseTest,RTCutoff=0.9,
##D               RICutoff=0.3,propMissingCutoff=0.5)$data
##D              
##D              
##D #Alternatively model-based clustering can be used for filtering
##D library(mclust)
##D clusterFilter <- Mclust(cbind(noiseTest@RT,noiseTest@RI),G=2)
##D plot(clusterFilter,what = "classification")
##D meanRTCluster <-tapply(noiseTest@RT,clusterFilter$classification,mean)
##D bestCluster <- names(meanRTCluster[which.min(meanRTCluster)])
##D filterdata <- kidneySimTimeGroup$data[G1,clusterFilter$classification==bestCluster]
##D               
## End(Not run)



