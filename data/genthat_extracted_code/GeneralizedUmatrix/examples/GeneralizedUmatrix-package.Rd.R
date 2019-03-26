library(GeneralizedUmatrix)


### Name: GeneralizedUmatrix-package
### Title: GeneralizedUmatrix
### Aliases: GeneralizedUmatrix-package
### Keywords: GeneralizedUmatrix U-matrix Umatrix U-Matrix Visualization
###   DimensionalityReduction

### ** Examples

data("Chainlink")
Data=Chainlink$Data
Cls=Chainlink$Cls
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
#see also ProjectionBasedClustering package for other common projection methods
#see DatabionicSwarm for projection method without parameters or objective function
# ProjectedPoints=DatabionicSwarm::Pswarm(Data)$ProjectedPoints
## No test: 
resUmatrix=GeneralizedUmatrix(Data,ProjectedPoints)
plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches,Cls)
## End(No test)
##Interactive Island Generation 
## from a tiled Umatrix (toroidal assumption)
## Not run: 
##D 	Imx = ProjectionBasedClustering::interactiveGeneralizedUmatrixIsland(resUmatrix$Umatrix,
##D 	resUmatrix$Bestmatches)
##D 	plotTopographicMap(resUmatrix$Umatrix,
##D 
##D 	resUmatrix$Bestmatches, Imx = Imx)
## End(Not run)
#External Verification
## Not run: 
##D 
##D  DataVisualizations::Heatmap(Data,Cls)
##D  #if spherical cluster strcuture
##D  DataVisualizations::SilhouettePlot(Data,Cls)
## End(Not run)




