library(VecStatGraphs2D)


### Name: ArithmeticMean
### Title: Calculation of the Arithmetic Mean of the modules
### Aliases: ArithmeticMean
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   ArithmeticMean(modules)



