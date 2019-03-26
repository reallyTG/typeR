library(chipPCR)


### Name: CPP
### Title: Curve Pre-processor
### Aliases: CPP CPP.numeric CPP.matrix CPP.data.frame
###   CPP,numeric,numeric-method CPP,matrix,missing-method
###   CPP,data.frame,missing-method
### Keywords: background noise outlier normalize amplification methods

### ** Examples

# Function to pre-process an amplification curve.
# Take a subset of the C17 data frame.
data(C17)
par(mfrow = c(2,1))
plot(NA, NA, xlab = "Time [sec]", ylab = "refMFI", 
     main = "HDA Raw Data", 
     xlim = c(0, 2500), ylim = c(0,1.1), pch = 20)
for (i in 3:5) {
  lines(C17[1:50, 1], C17[1:50, i], col = i - 2, 
	type = "b", pch = 20)
}

legend(50, 0.5, c("55 degrees Celsius", "60 degrees Celsius", "65 degrees Celsius"), 
	col = c(1,2,3), pch = rep(20,3))

# Use CPP to pre-process the data by removing the missing value and 
# normalization of the data
plot(NA, NA, xlab = "Time [sec]", ylab = "refMFI", 
     main = "Curve Pre-processor Applied to HDA Data", 
     xlim = c(0, 2500), ylim = c(0,1.1), pch = 20)
for (i in 3:5) {
  y.cpp <- CPP(C17[2:50, 1], C17[2:50, i], method.norm = "minm", 
	      bg.outliers = TRUE)$y.norm
  lines(C17[2:50, 1], y.cpp, col = i - 2, 
	type = "b", pch = 20)
}
legend(50, 1, c("55 degrees Celsius", "60 degrees Celsius", "65 degrees Celsius"), 
	col = c(1,2,3), pch = rep(20,3))
par(mfrow = c(1,1))



