library(DatabionicSwarm)


### Name: DelaunayClassificationError
### Title: Delaunay Classification Error (DCE)
### Aliases: DelaunayClassificationError
### Keywords: Classification Error Delaunay Classification Error DCE
###   Quality measure QM Quality measurement Evaluation of projection
###   methods

### ** Examples

data(Hepta)
## No test: 
InputDistances=as.matrix(dist(Hepta$Data))
projection=Pswarm(InputDistances)
DelaunayClassificationError(Hepta$Data,projection$ProjectedPoints,Hepta$Cls,LC=projection$LC)$DCE
## End(No test)
## Don't show: 
n=nrow(Hepta$Data)
DelaunayClassificationError(Hepta$Data,cbind(runif(n),runif(n)),Hepta$Cls)$DCE
## End(Don't show)



