library(fBasics)


### Name: BoxPlot
### Title: Time Series Box Plots
### Aliases: boxPlot boxPercentilePlot
### Keywords: programming

### ** Examples

## data - 
   LPP <- LPP2005REC[, 1:6]
   plot(LPP, type = "l", col = "steelblue", main = "SP500")
   abline(h = 0, col = "grey")
   
## boxPlot -
   boxPlot(LPP) 



