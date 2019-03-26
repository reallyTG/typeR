library(fBasics)


### Name: HistogramPlot
### Title: Histogram and Density Plots
### Aliases: histPlot densityPlot logDensityPlot
### Keywords: programming

### ** Examples

## data - 
   SPI <- LPP2005REC[, "SPI"]
   plot(SPI, type = "l", col = "steelblue", main = "SP500")
   abline(h = 0, col = "grey")
   
## histPlot -
   histPlot(SPI) 
   
## densityPlot -
   densityPlot(SPI) 



