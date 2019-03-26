library(VecStatGraphs2D)


### Name: ModulePopulationVariance
### Title: Calculation of the population variance of the modules
### Aliases: ModulePopulationVariance
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   ModulePopulationVariance(modules)



