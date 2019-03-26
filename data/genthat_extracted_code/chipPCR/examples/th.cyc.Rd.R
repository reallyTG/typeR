library(chipPCR)


### Name: th.cyc
### Title: Threshold Cycle
### Aliases: th.cyc
### Keywords: MIQE threshold Ct Cq

### ** Examples

# First example
# Raw data from the VIMCFX96_69 data set.
# Cycles
x <- VIMCFX96_69[, 1]
# Fluoresce values
y <- VIMCFX96_69[, 2]

# Plot the raw data
plot(x, y, xlab = "Cycle", ylab = "Fluo")
# Calculate the the Ct value
res <- th.cyc(x, y, r = 2300)
lines(res@input, col = 2, lwd = 2)
# Threshold fluorescence value
abline(h = res@.Data[2], col = 3)
# Calculated Ct value
abline(v = res@.Data[1], col = 4)

# Second example
# Application of the th.cyc method to determine the Cq from a continous
# amplification reaction.
plot(NA, NA, xlim = c(0,80), ylim = c(0,1200), xlab = "Time [min]", 
     ylab = "Voltage [micro V]", main = "ccPCR - Raw Data")

# Threshold level "r" (50 micro Volts)
for (i in c(1,3,5,7)) {
  y.tmp <- capillaryPCR[, i + 1] - mean(capillaryPCR[1L:150, i + 1])
  Ct.tmp <- th.cyc(capillaryPCR[, i], y.tmp, r = 50, linear = FALSE)
  abline(v = Ct.tmp[1])
  text(Ct.tmp[1] * 1.1, 1200, paste(round(Ct.tmp[1], 1), "\nmin"))
  lines(capillaryPCR[, i], y.tmp, type = "b", pch = 20 - i) 
  points(Ct.tmp@input, col = "red", pch = 19)
}
abline(h = 50)
legend(5,800, c("Run 1", "Run 2", "Run 3", "Control"), pch = c(19, 17, 15, 13), 
      lwd = 1.5)



