library(GeneralizedUmatrix)


### Name: XYcoords2LinesColumns
### Title: XYcoords2LinesColumns(X,Y) Converts points given as x(i),y(i)
###   coordinates to integer coordinates Columns(i),Lines(i)
### Aliases: XYcoords2LinesColumns

### ** Examples

data("Chainlink")
Data=Chainlink$Data
InputDistances=as.matrix(dist(Data))
res=cmdscale(d=InputDistances, k = 2, eig = TRUE, add = FALSE, x.ret = FALSE)
ProjectedPoints=as.matrix(res$points)
GridConvertedPoints=XYcoords2LinesColumns(ProjectedPoints[,1],ProjectedPoints[,2],PlotIt=FALSE)



