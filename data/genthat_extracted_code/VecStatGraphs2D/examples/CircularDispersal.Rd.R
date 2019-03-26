library(VecStatGraphs2D)


### Name: CircularDispersal
### Title: Calculation of the Circular Dispersal of the Azimuths
### Aliases: CircularDispersal
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   CircularDispersal(azimuths)



