library(DataVisualizations)


### Name: Heatmap
### Title: Heatmap for Clustering
### Aliases: Heatmap
### Keywords: Heatmap heatmap heat map

### ** Examples

data("Lsun3D")
Cls=Lsun3D$Cls
Data=Lsun3D$Data
## No test: 
Heatmap(as.matrix(dist(Data)),Cls = Cls)
## End(No test)
## Don't show: 
Heatmap(as.matrix(dist(Data[1:50,])),Cls = Cls[1:50])
## End(Don't show)



