library(VecStatGraphs3D)


### Name: NumberOfElements3D
### Title: Calculation of the Number of Elements of the modules.
### Aliases: NumberOfElements3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   NumberOfElements3D(modules)



