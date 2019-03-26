library(VecStatGraphs2D)


### Name: AllAzimuthStatistics
### Title: Calculation of all statistics of the azimuths
### Aliases: AllAzimuthStatistics
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   AllAzimuthStatistics(azimuths, ndig=4)



