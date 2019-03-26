library(VecStatGraphs2D)


### Name: MedianAzimuth
### Title: Calculation of the median azimuth of the azimuths
### Aliases: MedianAzimuth
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   MedianAzimuth(azimuths)



