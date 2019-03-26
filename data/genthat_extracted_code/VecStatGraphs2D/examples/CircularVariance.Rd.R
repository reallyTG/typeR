library(VecStatGraphs2D)


### Name: CircularVariance
### Title: Calculation of the Circular Variance of the azimuths
### Aliases: CircularVariance
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   CircularVariance(azimuths)



