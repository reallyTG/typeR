library(chipPCR)


### Name: bg.max
### Title: Simple function to detect and correct the background range
### Aliases: bg.max bg.max.numeric bg.max.matrix bg.max.data.frame
###   bg.max,numeric,numeric-method bg.max,matrix,missing-method
###   bg.max,data.frame,missing-method
### Keywords: background range methods

### ** Examples

# First example: Test for the background of an amplification reaction.
par(mfrow = c(2,1))
res <- AmpSim(cyc = 1:40, Cq = 25)
background <- bg.max(res)
plot(background, main = "Estimation of the Background Range\n
in Absence of Noise")
res.noise <- AmpSim(cyc = 1:40, Cq = 25, noise = TRUE)
background.noise <- bg.max(res.noise)
plot(background.noise, main = "Estimation of the Background Range\n
in Presence of Noise")
par(mfrow = c(1,1))


# Second example: A simple function to test for a background range.
# Data were taken form the chipPCR C17 data set.
# Note that the not the time but the "cycle number" was
# used to calculate the background range.
data(C17)
plot(C17[, 2], C17[,  3], xlab = "Cycle", ylab = "RFU", 
     main = "Estimate the begin of the Amplification\n of a HDA", 
     pch = 20)
res <- bg.max(C17[, 2:3], bg.corr = 1.4, bg.start = 1)
abline(v = c(slot(res, "bg.start"), slot(res, "bg.stop")), 
       col = c(1,2))
abline(h = slot(res, "fluo"), col = "blue")

# Third example: Test for the background of an amplification reaction.
# Simulate amplification curves with different quantification points
# within 40 cycles.
cyc <- seq(1, 40, 1)

# Use a five parameter model to simulate amplification curves
b <- -15; c <- 0.02; d <- 1
# Define the different quantification points with a difference of
# circa 3.32 cycles
e <- seq(21, 35, 3.32)

# Plot the amplification curves and the estimated background ranges.
plot(NA, NA, xlim = c(1, 40), ylim = c(0, 1), xlab = "Cycles", 
     ylab = "Fluorescence")
     
for (i in 1:length(e)) {
  fluo <- c + (d - c)/(1 + exp(b * (log(cyc) - log(e[i]))))
  points(cyc, fluo, type = "b", col = i, pch = 20)
  res <- bg.max(cyc, fluo, bg.corr = 1.4, bg.start = 1)
  abline(v = slot(res, "bg.stop"), col = i)
  abline(h = slot(res, "fluo"), col = i)
}



