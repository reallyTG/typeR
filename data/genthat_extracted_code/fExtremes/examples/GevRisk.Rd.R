library(fExtremes)


### Name: GevRisk
### Title: Generalized Extreme Value Modelling
### Aliases: GevRisk gevrlevelPlot
### Keywords: models

### ** Examples
  
## Load Data:
   # BMW Stock Data - negative returns
   x = -as.timeSeries(data(bmwRet))
   colnames(x)<-"BMW"
   head(x)
   
## gevFit -
   # Fit GEV to monthly Block Maxima:
   fit = gevFit(x, block = "month")  
   print(fit)
   
## gevrlevelPlot -
   # Return Level Plot:
   gevrlevelPlot(fit)



