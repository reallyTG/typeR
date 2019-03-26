library(VecStatGraphs2D)


### Name: DrawDistribution
### Title: Graphic representation of the distribution of the azimuths
### Aliases: DrawDistribution
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   DrawDistribution(azimuths, SVGf=0)



