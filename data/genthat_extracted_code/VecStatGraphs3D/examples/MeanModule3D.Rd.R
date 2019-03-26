library(VecStatGraphs3D)


### Name: MeanModule3D
### Title: Calculation of the Mean Module of the angles.
### Aliases: MeanModule3D
### Keywords: angle

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   MeanModule3D(coordinates)



