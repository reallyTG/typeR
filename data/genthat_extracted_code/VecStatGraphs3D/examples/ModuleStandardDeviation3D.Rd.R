library(VecStatGraphs3D)


### Name: ModuleStandardDeviation3D
### Title: Calculation of the Standard Deviation of the modules.
### Aliases: ModuleStandardDeviation3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ModuleStandardDeviation3D(modules)



