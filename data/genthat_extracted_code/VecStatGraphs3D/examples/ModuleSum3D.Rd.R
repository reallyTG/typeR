library(VecStatGraphs3D)


### Name: ModuleSum3D
### Title: Calculation of the Sum of the Modules.
### Aliases: ModuleSum3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ModuleSum3D(modules)



