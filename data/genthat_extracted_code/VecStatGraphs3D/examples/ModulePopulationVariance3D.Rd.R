library(VecStatGraphs3D)


### Name: ModulePopulationVariance3D
### Title: Calculation of the Population Variance of the modules.
### Aliases: ModulePopulationVariance3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ModulePopulationVariance3D(modules)



