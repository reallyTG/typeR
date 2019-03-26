library(VecStatGraphs3D)


### Name: SphericalStandardError3D
### Title: Calculation of the Standard Error of the angles.
### Aliases: SphericalStandardError3D
### Keywords: angle

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   SphericalStandardError3D(coordinates)



