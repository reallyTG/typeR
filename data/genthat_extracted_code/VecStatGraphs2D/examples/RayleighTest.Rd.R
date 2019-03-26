library(VecStatGraphs2D)


### Name: RayleighTest
### Title: Rayleigh test. Formal test of uniformity
### Aliases: RayleighTest
### Keywords: test

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   RayleighTest(azimuths)



