library(VecStatGraphs3D)


### Name: KurtosisModuleCoefficient3D
### Title: Calculation of the kurtosis coefficient of the modules in 3D
### Aliases: KurtosisModuleCoefficient3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   KurtosisModuleCoefficient3D(modules)



