library(VecStatGraphs3D)


### Name: MaxValue3D
### Title: Calculation of the Maximum Value of the modules.
### Aliases: MaxValue3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   MaxValue3D(modules)



