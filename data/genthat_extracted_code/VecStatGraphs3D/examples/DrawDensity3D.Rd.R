library(VecStatGraphs3D)


### Name: DrawDensity3D
### Title: Graphic representation of a point Density Map.
### Aliases: DrawDensity3D
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   DrawDensity3D(coordinates, Layers=3, Div=50)



