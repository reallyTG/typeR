library(chipPCR)


### Name: C17
### Title: Helicase Dependent Amplification of HPRT1 at Different
###   Temperatures using the VideoScan Platform 2.0
### Aliases: C17
### Keywords: datasets HDA HPRT1 VideoScan

### ** Examples

data(C17)
plot(NA, NA, xlim = c(0,5000), ylim = c(0,1.2), xlab = "Time [sec]", 
     ylab = "Fluorescence", 
     main = "Temperature dependency of HDA amplification reactions")
  points(C17[, 1], C17[, 3], type = "b", col = 1, pch = 20)
  points(C17[, 1], C17[, 4], type = "b", col = 2, pch = 20)
  points(C17[, 1], C17[, 5], type = "b", col = 3, pch = 20)
legend(2000, 0.4, c("55 degrees Celsius", "60 degrees Celsius", "65 degrees Celsius"), 
	col = c(1,2,3), pch = rep(20,3))




