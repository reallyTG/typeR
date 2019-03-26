library(openintro)


### Name: myPDF
### Title: Custom PDF function
### Aliases: myPDF myPNG
### Keywords: PDF Plotting Save Graphics myPDF

### ** Examples

data(marioKart)
#=====> Save a plot to a PDF <=====#
# myPDF("myPlot.pdf")
data(run10)
histPlot(run10$time)
# dev.off()

#=====> Save a plot to a PNG <=====#
# myPNG("myPlot.pdf")
data(run10)
histPlot(run10$time)
# dev.off()



