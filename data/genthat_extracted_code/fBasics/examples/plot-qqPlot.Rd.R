library(fBasics)


### Name: QuantileQuantilePlots
### Title: Quantile-Quantile Plots
### Aliases: qqnormPlot qqnigPlot qqghtPlot qqgldPlot
### Keywords: programming

### ** Examples

## data - 
   SPI <- LPP2005REC[, "SPI"]
   plot(SPI, type = "l", col = "steelblue", main = "SP500")
   abline(h = 0, col = "grey")
   
## qqPlot -
   qqnormPlot(SPI) 



