library(VecStatGraphs2D)


### Name: SkewnessAzimuthCoefficient
### Title: Calculation of the skewness coefficient of the azimuths
### Aliases: SkewnessAzimuthCoefficient
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   SkewnessAzimuthCoefficient(azimuths)



