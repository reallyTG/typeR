library(chipPCR)


### Name: C81
### Title: Helicase Dependent Amplification of pCNG1 using the VideoScan
###   Platform
### Aliases: C81
### Keywords: datasets HDA EvaGreen HCU VideoScan

### ** Examples

data(C81)
# First example
# Comparison of Lowess, Moving average and splines to smooth amplification curve 
# data of
# HDA for pCNG1.

plot(NA, NA, xlim = c(0, 120), ylim = c(0, 1.2), xlab = "Time [min]", 
     ylab = "Fluorescence", main = "VideScan HCU HDA amplification - Raw data")
  points(C81[, 2]/60, C81[, 3], type = "b", col = 1, pch = 20)
  points(C81[, 4]/60, C81[, 5], type = "b", col = 2, pch = 20)
legend(2000, 0.4, c("D1", "D2"), col = c(1,2), pch = rep(20,2))




