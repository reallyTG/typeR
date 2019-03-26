library(DRIP)


### Name: surfaceCluster
### Title: Denoising, deblurring and edge-preserving
### Aliases: surfaceCluster
### Keywords: Surface estimation, local pixel clustering

### ** Examples

data(brain) 
fit = surfaceCluster(image=brain, bandwidth=4, sig.level=.9995, cw=3, blur=TRUE)



