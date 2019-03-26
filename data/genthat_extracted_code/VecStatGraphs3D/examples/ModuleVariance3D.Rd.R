library(VecStatGraphs3D)


### Name: ModuleVariance3D
### Title: Calculation of the Variance of the modules.
### Aliases: ModuleVariance3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ModuleVariance3D(modules)



