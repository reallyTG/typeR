library(VecStatGraphs2D)


### Name: ModuleVariance
### Title: Calculation of the variance of the modules
### Aliases: ModuleVariance
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   ModuleVariance(modules)



