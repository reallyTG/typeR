library(GeneralizedUmatrix)


### Name: plotTopographicMap
### Title: shows generelized Umatrix visualization
### Aliases: plotTopographicMap
### Keywords: topographic map visualization U-Matrix Umatrix
###   GeneralizedUmatrix

### ** Examples


data("Chainlink")
Data=Chainlink$Data
Cls=Chainlink$Cls
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
#see also ProjectionBasedClustering package for other common projection methods
## No test: 
resUmatrix=GeneralizedUmatrix(Data,ProjectedPoints)
## visualization
plotTopographicMap(GeneralizedUmatrix = resUmatrix$Umatrix,resUmatrix$Bestmatches)
## To save as STL for 3D printing
 rgl::writeSTL("GenerelizedUmatrix_3d_model.stl")

## Save the visualization as a picture with
library(rgl)
rgl.snapshot('test.png')
## End(No test)
## Don't show: 
	resUmatrix=GeneralizedUmatrix(Data[1:2,],ProjectedPoints[1:2,])
	#plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches)#testing takes longer than 5 secs
## End(Don't show)



