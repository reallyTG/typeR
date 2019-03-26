library(VecStatGraphs3D)


### Name: Range3D
### Title: Calculation of the Range of the modules.
### Aliases: Range3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   Range3D(modules)



