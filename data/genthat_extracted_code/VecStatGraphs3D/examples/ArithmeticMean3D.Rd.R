library(VecStatGraphs3D)


### Name: ArithmeticMean3D
### Title: Calculation of Mean Arithmetic modules.
### Aliases: ArithmeticMean3D
### Keywords: module

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   modules<-dat[,1]
   ArithmeticMean3D(modules)



