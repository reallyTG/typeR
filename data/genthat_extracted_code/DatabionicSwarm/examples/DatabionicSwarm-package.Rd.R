library(DatabionicSwarm)


### Name: DatabionicSwarm-package
### Title: Swarm Intelligence for Self-Organized Clustering
### Aliases: DatabionicSwarm-package DatabionicSwarm
### Keywords: DBS DataBionic swarm swarm intelligence swarm intelligence
###   Databionic cluster analysis clustering visualization DR
###   Dimensionality Reduction projection Pswarm self-organization
###   emergence nash equilibrium game theory projection projection method
###   package

### ** Examples

data('Lsun3D')
##2d projection, without instant visualization of steps
#DistanceMatrix hast to be defined by the user.
InputDistances=as.matrix(dist(Lsun3D$Data))
## No test: 
projection=Pswarm(InputDistances)
#2d projection, with instant visualization 
#of steps and DataMatrix (Distance is Euclidean per default)

projection=Pswarm(Lsun3D$Data,Cls=Lsun3D$Cls,PlotIt=T)
#
##Computation of Generalized Umatrix
# If Non Euclidean Distances are used, Please Use \code{SammonsMapping}
# from the ProjectionBasedClustering package with the correct OutputDimension
# to generate a new DataMatrix from the distances (see SheppardDiagram
# or KruskalStress)
visualization=GeneratePswarmVisualization(Data = Lsun3D$Data,

projection$ProjectedPoints,projection$LC)
## Visualizuation of GenerelizedUmatrix, 
# Estimation of the Number of Clusters=Number of valleys
library(GeneralizedUmatrix)#install if not installed
GeneralizedUmatrix::plotTopographicMap(visualization$Umatrix,visualization$Bestmatches)
## Automatic Clustering
# number of Cluster from dendrogram (PlotIt=TRUE) or visualization 
Cls=DBSclustering(k=3, Lsun3D$Data, 

visualization$Bestmatches, visualization$LC,PlotIt=FALSE)
# Verification, often its better to mark Outliers manually

GeneralizedUmatrix::plotTopographicMap(visualization$Umatrix,visualization$Bestmatches,Cls)
## End(No test)
## Not run: 
##D # To generate the 3D landscape in the shape of an island 
##D # from the toroidal topograpic map visualization
##D # you may cut your island interactivly around high mountain ranges
##D Imx = ProjectionBasedClustering::interactiveGeneralizedUmatrixIsland(visualization$Umatrix,
##D visualization$Bestmatches,Cls)
##D 
##D GeneralizedUmatrix::plotTopographicMap(visualization$Umatrix,
##D visualization$Bestmatches, Cls=Cls,Imx = Imx)
## End(Not run)
## Not run: 
##D library(ProjectionBasedClustering)#install if not installed
##D Cls2=ProjectionBasedClustering::interactiveClustering(visualization$Umatrix, 
##D visualization$Bestmatches, Cls)
## End(Not run)
## Don't show: 
data2=matrix(runif(n = 100),10,10)
distance=as.matrix(dist(data2))
res=Pswarm(distance,LC = c(10,12))
Cls=DBSclustering(k=2, data2, 

res$ProjectedPoints, res$LC,PlotIt=FALSE)

resUmatrix=GeneratePswarmVisualization(data2,res$ProjectedPoints,res$LC)
## End(Don't show)




