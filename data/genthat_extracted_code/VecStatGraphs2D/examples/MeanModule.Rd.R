library(VecStatGraphs2D)


### Name: MeanModule
### Title: Calculation of the mean module of the azimuths
### Aliases: MeanModule
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   MeanModule(azimuths)



