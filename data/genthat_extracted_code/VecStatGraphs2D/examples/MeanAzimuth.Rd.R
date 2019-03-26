library(VecStatGraphs2D)


### Name: MeanAzimuth
### Title: Calculation of the mean azimuth of the azimuths
### Aliases: MeanAzimuth
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   MeanAzimuth(azimuths)



