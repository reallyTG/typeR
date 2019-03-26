library(fBasics)


### Name: acfPlot
### Title: Autocorrelation Function Plots
### Aliases: acfPlot pacfPlot teffectPlot lacfPlot
### Keywords: hplot

### ** Examples
   
## data - 
   SPI <- LPP2005REC[, "SPI"]
   plot(SPI, type = "l", col = "steelblue", main = "SP500")
   abline(h = 0, col = "grey")

## teffectPlot -
   # Taylor Effect:
   teffectPlot(SPI)



