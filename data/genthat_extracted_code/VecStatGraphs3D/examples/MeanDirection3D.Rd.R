library(VecStatGraphs3D)


### Name: MeanDirection3D
### Title: Calculation of the Mean Direction of the angles.
### Aliases: MeanDirection3D
### Keywords: angle

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   MeanDirection3D(coordinates)



