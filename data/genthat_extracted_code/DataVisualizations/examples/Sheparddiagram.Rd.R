library(DataVisualizations)


### Name: Sheparddiagram
### Title: Draws a Shepard Diagram
### Aliases: Sheparddiagram
### Keywords: ShepardScatterPlot ScatterPlot Shepard ShepardDiagram Shepard
###   diagram

### ** Examples

data("Lsun3D")
Cls=Lsun3D$Cls
Data=Lsun3D$Data
InputDist=as.matrix(dist(Data))
res = stats::cmdscale(d = InputDist, k = 2, eig = TRUE, 
        add = FALSE, x.ret = FALSE)
ProjectedPoints = as.matrix(res$points)
## No test: 

Sheparddiagram(InputDist,as.matrix(dist(ProjectedPoints)),main = 'MDS')
## End(No test)
## Don't show: 

Sheparddiagram(InputDist[1:100,1:100],as.matrix(dist(ProjectedPoints))[1:100,1:100],main = 'MDS')
## End(Don't show)



