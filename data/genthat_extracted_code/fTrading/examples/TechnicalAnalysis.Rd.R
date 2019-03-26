library(fTrading)


### Name: TechnicalAnalysis
### Title: Tools for the Technical Analysis
### Aliases: TechnicalAnalysis emaTA biasTA medpriceTA typicalpriceTA
###   wcloseTA rocTA oscTA momTA macdTA cdsTA cdoTA vohlTA vorTA
###   stochasticTA fpkTA fpdTA spdTA apdTA wprTA rsiTA accelTA adiTA
###   adoscillatorTA bollingerTA chaikinoTA chaikinvTA garmanklassTA nviTA
###   obvTA pviTA pvtrendTA williamsadTA williamsrTA SMA EWMA
### Keywords: math

### ** Examples

## data -
   # Load MSFT Data:
   x = MSFT
   colnames(x)
   x = x[, "Close"]
   head(x)
   
## emaTA -
   # Exponential Moving Average:
   y = emaTA(x, lambda = 9)   
   seriesPlot(x)
   lines(y, col = "red")



