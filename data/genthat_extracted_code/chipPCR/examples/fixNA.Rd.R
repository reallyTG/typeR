library(chipPCR)


### Name: fixNA
### Title: Impute missing values into a column of amplification data
### Aliases: fixNA fixNA.numeric fixNA.matrix fixNA.data.frame
###   fixNA,numeric,numeric-method fixNA,matrix,missing-method
###   fixNA,data.frame,missing-method
### Keywords: spline isothermal linear amplification

### ** Examples

# Simulate a qPCR reaction with AmpSim with for 40 cycles
res <- AmpSim(cyc = c(1:40))
# Introduce a missing value in the transition between 
# the background and the exponential phase
res.NA <-res
res.NA[18, 2] <- NA
par(mfrow = c(2,2))
plot(res, xlab = "Cycles", ylab = "Fluorescence", type = "b", pch = 20, 
     main = "Simulation without missing value")
     abline(v = c(17.5, 18.5), col = "grey")
     abline(h = c(0.09, 0.14), col = "grey")

res.NA.linear <- fixNA(res.NA[, 1], res.NA[, 2], spline = FALSE, 
		       verbose = FALSE)
plot(res.NA.linear, xlab = "Cycles", ylab = "Fluorescence", type = "b", 
     pch = 20, main = "Simulation with linear imputed\n NA 
     value during transition")
     abline(v = c(17.5, 18.5), col = "grey")
     abline(h = c(0.09, 0.14), col = "grey")

plot(res.NA, xlab = "Cycles", ylab = "Fluorescence", type = "b", pch = 20, 
     main = "Simulation with missing\n value during transition")
     abline(v = c(17.5, 18.5), col = "grey")
     abline(h = c(0.09, 0.14), col = "grey")
res.NA.spline <- fixNA(res.NA[, 1], res.NA[, 2], spline = TRUE, 
		       verbose = FALSE)
plot(res.NA.spline, xlab = "Cycles", ylab = "Fluorescence", type = "b", 
      pch = 20, main = "Simulation with spline imputed\n NA value 
      during transition")
     abline(v = c(17.5, 18.5), col = "grey")
     abline(h = c(0.09, 0.14), col = "grey")     
par(mfrow = c(1,1))



