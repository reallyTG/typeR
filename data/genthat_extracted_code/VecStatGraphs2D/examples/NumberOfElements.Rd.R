library(VecStatGraphs2D)


### Name: NumberOfElements
### Title: Calculation of the number of elements of the modules
### Aliases: NumberOfElements
### Keywords: module

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   modules<-dat[,1]
   NumberOfElements(modules)



