library(ProjectionBasedClustering)


### Name: ProjectionBasedClustering-package
### Title: Projection Based Clustering
### Aliases: ProjectionBasedClustering-package

### ** Examples

data('Hepta')
#2d projection
# Visualizuation of GeneralizedUmatrix
## No test: 
projectionpoints=NeRV(Hepta$Data)
#Computation of Generalized Umatrix
library(GeneralizedUmatrix)
visualization=GeneralizedUmatrix(Data = Hepta$Data,projectionpoints)

plotTopographicMap(visualization$Umatrix,visualization$Bestmatches)
## End(No test)
##Interactive Island Generation 
## from a tiled Umatrix (toroidal assumption)
## Not run: 
##D 	Imx = ProjectionBasedClustering::interactiveGeneralizedUmatrixIsland(visualization$Umatrix,
##D 	visualization$Bestmatches)
##D 	plotTopographicMap(visualization$Umatrix,
##D 
##D 	visualization$Bestmatches, Imx = Imx)
## End(Not run)
## No test: 
# Automatic Clustering
LC=c(visualization$Lines,visualization$Columns)
# number of Cluster from dendrogram or visualization (PlotIt=T)
Cls=ProjectionBasedClustering(k=7, Hepta$Data, 

visualization$Bestmatches, LC,PlotIt=T)
# Verification
plotTopographicMap(visualization$Umatrix,visualization$Bestmatches,Cls)
## Sometimes you can improve a Clustering interactivly or mark additional Outliers manually
Cls2 = interactiveClustering(visualization$Umatrix, visualization$Bestmatches, Cls)
## End(No test)



