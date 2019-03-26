library(VecStatGraphs2D)


### Name: ModuleStandardDeviation
### Title: Calculation of the standard deviation of the modules
### Aliases: ModuleStandardDeviation
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   ModuleStandardDeviation(modules)



