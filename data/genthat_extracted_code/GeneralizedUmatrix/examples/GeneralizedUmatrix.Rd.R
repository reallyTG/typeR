library(GeneralizedUmatrix)


### Name: GeneralizedUmatrix
### Title: Generalized U-Matrix for projection methods
### Aliases: GeneralizedUmatrix getUmatrix4Projection
### Keywords: topographic map visualization U-Matrix Umatrix
###   GeneralizedUmatrix

### ** Examples

data("Chainlink")
Data=Chainlink$Data
Cls=Chainlink$Cls
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
## Not run: 
##D Stress = ProjectionBasedClustering::KruskalStress(InputDistances,
##D 
##D as.matrix(dist(ProjectedPoints)))
## End(Not run)
## Don't show: 
	resUmatrix=GeneralizedUmatrix(Data[1:2,],ProjectedPoints[1:2,])
	#plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches)#testing takes longer than 5 secs
## End(Don't show)
## No test: 
	resUmatrix=GeneralizedUmatrix(Data,ProjectedPoints)
	plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches,Cls)
## End(No test)



