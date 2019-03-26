library(VecStatGraphs3D)


### Name: SkewnessModuleCoefficient3D
### Title: Calculation of the skewness coefficient of the modules in 3D
### Aliases: SkewnessModuleCoefficient3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   SkewnessModuleCoefficient3D(modules)
   


