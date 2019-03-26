library(DatabionicSwarm)


### Name: DBSclustering
### Title: Databonic swarm clustering (DBS)
### Aliases: DBSclustering
### Keywords: swarm cluster analysis Databonic swarm clustering cluster
###   analysis cluster

### ** Examples

data("Lsun3D")
Data=Lsun3D$Data
InputDistances=as.matrix(dist(Data))
## No test: 
projection=Pswarm(InputDistances)
#autmatic Clustering without GeneralizedUmatrix visualization
Cls=DBSclustering(k=3, Data, 

projection$ProjectedPoints, projection$LC,PlotIt=TRUE)
## End(No test)
## Not run: 
##D visualization=GeneratePswarmVisualization(Data,
##D 
##D projection$ProjectedPoints,projection$LC)
##D ## Sometimes an automatic Clustering can be improved 
##D ## thorugh an interactive approach, 
##D ## e.g. if Outliers exist (see [Thrun/Ultsch, 2017])
##D library(ProjectionBasedClustering)
##D Cls2=ProjectionBasedClustering::interactiveClustering(visualization$Umatrix, 
##D visualization$Bestmatches, Cls)
## End(Not run)
## Don't show: 
data2=matrix(runif(n = 100),10,10)
distance=as.matrix(dist(data2))
res2=Pswarm(distance,LC = c(10,12))
Cls=DBSclustering(k=2, data2, 

res2$ProjectedPoints, res2$LC,PlotIt=FALSE)
## End(Don't show)




