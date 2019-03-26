library(chipPCR)


### Name: amptester
### Title: Amplification test
### Aliases: amptester
### Keywords: amplification threshold

### ** Examples

# First example
# Arrange graphs in orthogonal matrix and set parameter for the plot.
par(las = 0, bty = "n", cex.axis = 1.5, cex.lab = 1.5, 
    font = 2, cex.main = 1.8, oma = c(1,1,1,1))
    
# Simulation of an amplification curve with 40 cycles and a Cq of
# circa 28. The amplification curve of "pos" (positive) has low 
# noise and the amplification curve of "neg" (negative) has high 
# noise.

pos <- AmpSim(cyc = 1:40, Cq = 28, noise = TRUE, nnl = 0.03)
neg <- AmpSim(cyc = 1:40, Cq = 28, noise = TRUE, nnl = 0.8)

# Plot the raw data of the simulations.

par(fig = c(0,0.5,0.5,1))
plot(NA, NA, xlim = c(1, 40), ylim = c(0, 2.1), xlab = "Cycles", 
     ylab = "Fluorescence", main = "qPCR - Raw data", type = "b")
mtext("A", cex = 2, side = 3, adj = 0, font = 2)
points(pos, col = 1, typ = "b", pch = 19)
points(neg, col = 2, typ = "b", pch = 20)
legend(1, 2, c("Positive", "Negative Control (noise)"), 
	       pch = c(19,20), col = c(1,2), lwd = 2, bty = "n")

# Plot data again after an analysis by ampteser. "neg" is set to small 
# random numbers, while "pos" remains unchanged.

par(fig = c(0,0.5,0,0.5), new = TRUE)
plot(NA, NA, xlim = c(1, 40), ylim = c(0, 2.1), xlab = "Cycles", 
     ylab = "Fluorescence", main = "qPCR - amptester", type = "b")
points(amptester(pos[, 2]), col = 1, type = "b", pch = 19)
points(amptester(neg[, 2]), col = 2, type = "b", pch = 20)
legend(1, 2, c("Positive", "Negative Control (noise)"), 
       pch = c(19,20), col = c(1,2), lwd = 2, bty = "n")

# Use of amptester for time-dependent measurements. Amplification curves 
# from the capillaryPCR data set were processed in a loop. The results of 
# amptester are added to the raw data.

par(fig = c(0.5,1,0,1), new = TRUE)
colors <- rainbow(8)
plot(NA, NA, xlim = c(0,80), ylim = c(0,1300), xlab = "Time [min]", 
     ylab = "Voltage (micro V)", main = "ccPCR")
mtext("B", cex = 2, side = 3, adj = 0, font = 2)
sapply(c(1,3,5,7), function(i) {
    xy.tmp <- cbind(capillaryPCR[1:750, i], capillaryPCR[1:750, i + 1])
    
# Use amptester to analyse the amplification curve.
# Note: The decisions of amptester can be invoked via res.ampt@decisions
# in the present example.

    res.ampt <- amptester(xy.tmp[, 2])
    
# Use the "decisions" of amptester in a logic to automatically decide if an
# amplification reaction is positive. In this example linear regression test
# (lrt.test) and the threshold test (tht.dec) are used.

    res.ampt <- ifelse(res.ampt@decisions[2] == TRUE && 
		       res.ampt@decisions[4] == TRUE, "positve", "negative")

# Plot the amplification curve with the decisions.
    lines(xy.tmp[, 1], xy.tmp[, 2], type = "b", pch = 20, col = colors[i])
    text(75, max(na.omit(xy.tmp[, 2])), res.ampt, cex = 1.3, col = colors[i])
  }
)
# Second Example
# Example to test an amplification reaction.
# Simulate first a positive amplification curve with 45 cycles and than a 
# negative amplification curve with 45 cycles. The negative amplification
# curve is created from a normal distribution
# 
fluo.neg <- rnorm(45)
fluo.pos <- AmpSim(cyc = 1:45, Cq = 45, ampl = 40, noise = TRUE, 
		   nnl = 0.03)[, 2]

plot(NA, NA, xlim = c(1, 45), ylim = c(-1, 45), xlab = "Cycles", 
     ylab = "Fluorescence", 
     main = "Simulation of a qPCR with 45 Cycles", type = "b")
points(amptester(fluo.pos), type = "b", pch = 20)
points(amptester(fluo.neg), type = "b", col = "red", pch = 20)
points(1:45, fluo.neg, col = "red")

legend(1,40, c("Positive", "Negative Control (noise)", 
       "noise pattern"), pch = c(20,20,1), col = c(1,2,2), lwd = 2)



