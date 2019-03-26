library(VecStatGraphs2D)


### Name: RaoTest
### Title: Rao test. Formal test of uniformity
### Aliases: RaoTest
### Keywords: test

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   RaoTest(azimuths, Alpha = 0.01)



