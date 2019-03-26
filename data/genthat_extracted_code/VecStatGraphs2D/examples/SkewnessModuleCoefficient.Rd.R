library(VecStatGraphs2D)


### Name: SkewnessModuleCoefficient
### Title: Calculation of the skewness coefficient of the modules
### Aliases: SkewnessModuleCoefficient
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   SkewnessModuleCoefficient(modules)



