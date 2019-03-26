library(fNonlinear)


### Name: NonLinStatistics
### Title: Chaotic Time Series Statistics
### Aliases: NonLinStatistics mutualPlot falsennPlot recurrencePlot
###   separationPlot lyapunovPlot
### Keywords: models

### ** Examples

## mutualPlot -
   mutualPlot(logisticSim(1000))
   
## recurrencePlot -
   lorentz = lorentzSim(
     times = seq(0, 40, by = 0.01), 
     parms = c(sigma = 16, r = 45.92, b = 4), 
     start = c(-14, -13, 47), 
     doplot = FALSE) 
   recurrencePlot(lorentz[, 2], m = 3, d = 2, end.time = 800, eps = 3, 
     nt = 5, pch = '.', cex = 2)



