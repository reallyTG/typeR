library(VecStatGraphs2D)


### Name: KurtosisAzimuthCoefficient
### Title: Calculation of the kurtosis coefficient of the azimuths
### Aliases: KurtosisAzimuthCoefficient
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   KurtosisAzimuthCoefficient(azimuths)



