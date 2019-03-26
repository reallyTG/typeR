library(VecStatGraphs2D)


### Name: AllModuleStatistics
### Title: Calculation of all statistics of the modules.
### Aliases: AllModuleStatistics
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   AllModuleStatistics(modules, ndig = 4)



