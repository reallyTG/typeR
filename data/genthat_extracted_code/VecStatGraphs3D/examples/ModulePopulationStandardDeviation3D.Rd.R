library(VecStatGraphs3D)


### Name: ModulePopulationStandardDeviation3D
### Title: Calculation of the Population Standard Deviation of the modules.
### Aliases: ModulePopulationStandardDeviation3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ModulePopulationStandardDeviation3D(modules)



