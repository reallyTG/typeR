library(ProjectionBasedClustering)


### Name: interactiveClustering
### Title: GUI for interactive cluster analysis
### Aliases: interactiveClustering

### ** Examples

data('Hepta')
#2d projection
# Visualizuation of GeneralizedUmatrix
## No test: 
projectionpoints=NeRV(Hepta$Data)
#Computation of Generalized Umatrix
library(GeneralizedUmatrix)
visualization=GeneralizedUmatrix(Data = Hepta$Data,projectionpoints)



# Semi-Automatic Clustering done interactivly in a  shiny gui
Cls = interactiveClustering(visualization$Umatrix, visualization$Bestmatches)
#Plotting
plotTopographicMap(visualization$Umatrix,visualization$Bestmatches,Cls)
## End(No test)



