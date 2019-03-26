library(DataVisualizations)


### Name: DataVisualizations-package
### Title: Visualizations of High-Dimensional Data
### Aliases: DataVisualizations-package DataVisualizations
### Keywords: clustering visualization Dimensionality Reduction projection
###   Pie chart slope chart fanplot Bland-Altman plot PDE violin violin
###   plot beanplot

### ** Examples



data("Lsun3D")
Data=Lsun3D$Data
## No test: 
PixelMatrixPlot(Data)
## End(No test)

## No test: 
InspectDistances(as.matrix(dist(Data)))
## End(No test)

data("ITS")
data("MTY")
Inds=which(ITS<900&MTY<8000)
plot(ITS[Inds],MTY[Inds],main='Bimodality is not visible in normal scatter plot')
## No test: 
PDEscatter(ITS[Inds],MTY[Inds],xlab = 'ITS in EUR',

ylab ='MTY in EUR' ,main='Pareto Density Estimation indicates Bimodality' )
## End(No test)

MAlist=MAplot(ITS,MTY)

data("Lsun3D")
Cls=Lsun3D$Cls
Data=Lsun3D$Data
#clear cluster structure
plot(Data[,1:2],col=Cls)
#However, the silhouette plot does not indicate a very good clustering in cluster 1 and 2
## No test: 
SilhouettePlot(Data,Cls = Cls)
## End(No test)
## No test: 
Heatmap(as.matrix(dist(Data)),Cls = Cls)
## End(No test)



