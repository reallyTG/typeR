library(DRIP)


### Name: threeStage
### Title: Denoising, deblurring and edge-preserving
### Aliases: threeStage
### Keywords: Image restoration, principal component line

### ** Examples

data(sar)
stepEdge = stepEdgeLCK(sar, bandwidth=4, thresh=20)
stepEdge1 = modify2(bandwidth=4, stepEdge)
fit = threeStage(image=sar, bandwidth=4, edge1=
stepEdge1, edge2=array(0, rep(ncol(sar), 2)))



