library(mvMonitoring)


### Name: threshold
### Title: Non-parametric Threshold Estimation
### Aliases: threshold

### ** Examples

nrml <- mspProcessData(faults = "NOC")
scaledData <- scale(nrml[,-1])
pca_obj <- pca(scaledData)
threshold(pca_object = pca_obj)




