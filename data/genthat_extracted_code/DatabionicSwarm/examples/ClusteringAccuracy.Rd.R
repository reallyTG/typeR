library(DatabionicSwarm)


### Name: ClusteringAccuracy
### Title: ClusteringAccuracy
### Aliases: ClusteringAccuracy
### Keywords: Accuracy Clustering

### ** Examples

data(Hepta)
## No test: 
InputDistances=as.matrix(dist(Hepta$Data))
projection=Pswarm(InputDistances)
visualization=GeneratePswarmVisualization(Data = Hepta$Data,

projection$ProjectedPoints,projection$LC)
Cls=DBSclustering(k=7, Hepta$Data, visualization$Bestmatches,

visualization$LC,PlotIt=FALSE)
ClusteringAccuracy(Hepta$Cls,Cls,K=9)
## End(No test)
## Don't show: 
ClusteringAccuracy(Hepta$Cls,rep(1,length(Hepta$Cls)))
## End(Don't show)



