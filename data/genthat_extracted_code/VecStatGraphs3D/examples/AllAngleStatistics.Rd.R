library(VecStatGraphs3D)


### Name: AllAngleStatistics
### Title: Calculation of All Statistics of the Angle.
### Aliases: AllAngleStatistics
### Keywords: angle

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   AllAngleStatistics(coordinates, ndig=4)



