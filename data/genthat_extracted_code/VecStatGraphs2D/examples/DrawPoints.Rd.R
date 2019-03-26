library(VecStatGraphs2D)


### Name: DrawPoints
### Title: Graphic representation of points
### Aliases: DrawPoints
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   X_coordinate<-dat[,3]
   Y_coordinate<-dat[,4]
   DrawPoints(X_coordinate, Y_coordinate, PercentageOutliers=8, SVGf=0)



