library(VecStatGraphs3D)


### Name: AllModuleStatistics3D
### Title: Calculation of All Statistics of the Modules.
### Aliases: AllModuleStatistics3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   AllModuleStatistics3D(modules, ndig=4)



