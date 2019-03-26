library(VecStatGraphs3D)


### Name: StandardError3D
### Title: Calculation of the Standard Error of the modules.
### Aliases: StandardError3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   StandardError3D(modules)



