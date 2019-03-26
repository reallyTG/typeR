library(VecStatGraphs2D)


### Name: CircularStandardDeviation
### Title: Calculation of the Circular Standard Deviation of the azimuths
### Aliases: CircularStandardDeviation
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   CircularStandardDeviation(azimuths)



