library(VecStatGraphs2D)


### Name: DrawDensityMap
### Title: Graphic representation of a point density map
### Aliases: DrawDensityMap
### Keywords: graphics

### ** Examples
 
  FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D") 
  dat<-LoadData(FileName, Type=2) 
  X_coordinate<-dat[,3] 
  Y_coordinate<-dat[,4] 
  DrawDensityMap(X_coordinate, Y_coordinate, PaintPoint = TRUE, Div=200, SVGf=0) 



