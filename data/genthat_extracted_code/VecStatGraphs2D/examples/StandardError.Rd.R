library(VecStatGraphs2D)


### Name: StandardError
### Title: Calculation of the standard error of the modules
### Aliases: StandardError
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   StandardError(modules)



