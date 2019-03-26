library(ProjectionBasedClustering)


### Name: interactiveGeneralizedUmatrixIsland
### Title: GUI for cutting out an Island.
### Aliases: interactiveGeneralizedUmatrixIsland

### ** Examples

data("Hepta")
Data=Hepta$Data
Cls=Hepta$Cls
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
#see also ProjectionBasedClustering package for other common projection methods
## No test: 
resUmatrix=GeneralizedUmatrix(Data,ProjectedPoints)
plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches,Cls)
## End(No test)
##Interactive Island Generation 
## from a tiled Umatrix (toroidal assumption)

## Not run: 
##D 	Imx = interactiveGeneralizedUmatrixIsland(resUmatrix$Umatrix,
##D 
##D 	resUmatrix$Bestmatches)
##D 	plotTopographicMap(resUmatrix$Umatrix,
##D 
##D 	resUmatrix$Bestmatches, Imx = Imx)
## End(Not run)



