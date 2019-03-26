library(VecStatGraphs2D)


### Name: DrawModuleAndAzimuthDistribution
### Title: Graphic representation of module and azimuth distributions
### Aliases: DrawModuleAndAzimuthDistribution
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   X_coordinate<-dat[,3]
   Y_coordinate<-dat[,4]
   DrawModuleAndAzimuthDistribution(X_coordinate, Y_coordinate, SVGf=0)



