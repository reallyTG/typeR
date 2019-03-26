library(fBasics)


### Name: ScalingLawPlot
### Title: Scaling Law Bahaviour
### Aliases: scalinglawPlot scalinglawPlot
### Keywords: hplot

### ** Examples
   
## data - 
   SPI <- LPP2005REC[, "SPI"]
   plot(SPI, type = "l", col = "steelblue", main = "SP500")
   abline(h = 0, col = "grey")

## teffectPlot -
   # Scaling Law Effect:
   scalinglawPlot(SPI)



