library(mvMonitoring)


### Name: faultDetect
### Title: Process Fault Detection
### Aliases: faultDetect

### ** Examples

nrml <- mspProcessData(faults = "NOC")
scaledData <- scale(nrml[,-1])
pca_obj <- pca(scaledData)
thresh_obj <- threshold(pca_object = pca_obj)

faultDetect(threshold_object = thresh_obj,
            observation = scaledData[1,])




