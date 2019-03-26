library(VecStatGraphs2D)


### Name: ModulePopulationStandardDeviation
### Title: Calculation of the population standard deviation of the modules
### Aliases: ModulePopulationStandardDeviation
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   ModulePopulationStandardDeviation(modules)



