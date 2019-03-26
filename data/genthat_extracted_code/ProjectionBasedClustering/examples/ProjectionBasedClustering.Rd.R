library(ProjectionBasedClustering)


### Name: ProjectionBasedClustering
### Title: automated Clustering approach of the Databonic swarm with
###   abstact U distances
### Aliases: ProjectionBasedClustering
### Keywords: swarm Databonic swarm clustering cluster analysis cluster

### ** Examples

data('Hepta')
#2d projection
## No test: 
projectionpoints=NeRV(Hepta$Data)
#Computation of Generalized Umatrix
visualization=GeneralizedUmatrix(Data = Hepta$Data,projectionpoints)
# Visualizuation of GenerelizedUmatrix
library(GeneralizedUmatrix)
plotTopographicMap(visualization$Umatrix,visualization$Bestmatches)
# Automatic Clustering
LC=c(visualization$Lines,visualization$Columns)
# number of Cluster from dendrogram or visualization (PlotIt=T)
Cls=ProjectionBasedClustering(k=7, Hepta$Data, 

visualization$Bestmatches, LC,PlotIt=T)
# Verification
plotTopographicMap(visualization$Umatrix,visualization$Bestmatches,Cls)
## End(No test)



