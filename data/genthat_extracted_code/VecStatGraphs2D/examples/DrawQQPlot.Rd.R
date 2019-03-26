library(VecStatGraphs2D)


### Name: DrawQQPlot
### Title: Graphical assessment of uniformity
### Aliases: DrawQQPlot
### Keywords: test

### ** Examples

   FileName<-system.file("data/RectangularData.txt", package="VecStatGraphs2D")
   dat<-LoadData(FileName, Type=2)
   azimuths<-dat[,2]
   DrawQQPlot(azimuths, SVGf=0)



