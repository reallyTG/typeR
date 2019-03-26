library(VecStatGraphs3D)


### Name: MinValue3D
### Title: Calculation of the Minimum Value of the modules.
### Aliases: MinValue3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   MinValue3D(modules)



