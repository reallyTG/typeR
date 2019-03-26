library(VecStatGraphs2D)


### Name: KurtosisModuleCoefficient
### Title: Calculation of the kurtosis coefficient of the modules
### Aliases: KurtosisModuleCoefficient
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   KurtosisModuleCoefficient(modules)



