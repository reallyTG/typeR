library(VecStatGraphs3D)


### Name: ConcentrationParameter3D
### Title: Calculation of concentration parameter of the angles.
### Aliases: ConcentrationParameter3D
### Keywords: angle

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   ConcentrationParameter3D(coordinates)



