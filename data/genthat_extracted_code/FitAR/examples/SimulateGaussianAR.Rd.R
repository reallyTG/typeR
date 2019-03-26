library(FitAR)


### Name: SimulateGaussianAR
### Title: Autoregression Simulation
### Aliases: SimulateGaussianAR
### Keywords: ts

### ** Examples

#Percival and Walden (1993, p.46) illustrated a time series with a 
#very peaked spectrum with the AR(4) with coefficients
#c(2.7607,-3.8106,2.6535,-0.9238) with NID(0,1) innovations.
#
z<-SimulateGaussianAR(c(2.7607,-3.8106,2.6535,-0.9238),1000)
library(lattice)
TimeSeriesPlot(z)



