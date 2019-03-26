library(VecStatGraphs2D)


### Name: DrawAzimuthDensity
### Title: Graphical representation of the azimuth density
### Aliases: DrawAzimuthDensity
### Keywords: graphics

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   DrawAzimuthDensity(azimuths, Period = 15, SVGf=0)



