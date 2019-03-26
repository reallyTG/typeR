library(VecStatGraphs2D)


### Name: DrawHistogram
### Title: Graphic representation of the histogram of the azimuth
###   distribution
### Aliases: DrawHistogram
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   DrawHistogram(azimuths, ClassSize=15, SVGf=0)



