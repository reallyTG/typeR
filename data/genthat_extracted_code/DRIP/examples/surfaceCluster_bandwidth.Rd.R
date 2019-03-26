library(DRIP)


### Name: surfaceCluster_bandwidth
### Title: Denoising, deblurring, bandwidth selection, and edge-preserving
### Aliases: surfaceCluster_bandwidth
### Keywords: Surface estimation, local pixel clustering

### ** Examples

data(brain) 
bandwidth_select = surfaceCluster_bandwidth(image=brain,
bandwidths=c(3:4), sig.level=.9995, blur=TRUE)



