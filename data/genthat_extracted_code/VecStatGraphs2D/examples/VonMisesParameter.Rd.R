library(VecStatGraphs2D)


### Name: VonMisesParameter
### Title: Calculation of von Mises concentration parameter of the azimuths
### Aliases: VonMisesParameter
### Keywords: azimuth

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   VonMisesParameter(azimuths)



