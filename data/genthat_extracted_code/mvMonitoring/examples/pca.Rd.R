library(mvMonitoring)


### Name: pca
### Title: PCA for Data Scatter Matrix
### Aliases: pca

### ** Examples

nrml <- mspProcessData(faults = "NOC")
scaledData <- scale(nrml[,-1])
pca(scaledData)




