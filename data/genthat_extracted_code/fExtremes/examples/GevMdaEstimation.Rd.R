library(fExtremes)


### Name: GevMdaEstimation
### Title: Generalized Extreme Value Modelling
### Aliases: GevMdaEstimation hillPlot shaparmPlot shaparmPickands
###   shaparmHill shaparmDEHaan
### Keywords: models

### ** Examples
  
## Load Data:
   x = as.timeSeries(data(danishClaims))
   colnames(x) <- "Danish"
   head(x)
   
## hillPlot -
   # Hill plot of heavy-tailed Danish fire insurance data 
   par(mfrow = c(1, 1))
   hillPlot(x, plottype = "xi")
   grid()



