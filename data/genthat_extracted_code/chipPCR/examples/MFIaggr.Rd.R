library(chipPCR)


### Name: MFIaggr
### Title: Multiple comparison of the cycle dependent variance of the
###   fluorescence
### Aliases: MFIaggr MFIaggr.numeric MFIaggr.matrix MFIaggr.data.frame
###   MFIaggr,numeric,numeric-method MFIaggr,matrix,missing-method
###   MFIaggr,data.frame,missing-method
### Keywords: deviation fluorescence deviation fluorescence distribution

### ** Examples

# First Example
# Cycle dependent variance of the refMFI using standard measures 
# (Mean, Standard Deviation (SD)).
# Use Standard Deviation (SD) in the plot

data(VIMCFX96_60)

MFIaggr(VIMCFX96_60[, 1], VIMCFX96_60[, 2:ncol(VIMCFX96_60)])

#alternative usage
MFIaggr(VIMCFX96_60)

#only second and forth column
plot(MFIaggr(VIMCFX96_60, fluo = c(2, 4)))

# Example
# Use of MFIaggr to test for heteroskedasticity using the Breusch-Pagan 
# test. The data were aggregated with the MFIaggr function and assigned to
# the object res. The standard deviation was transformed to the variance.
# The plot shows the cycle dependent variance.
# First cycles 1 to 10 of 96 qPCR replicate amplification curves were
# analyzed. Next the cycles 1 to 40 of the same amplification curve data 
# were analyzed. The Breusch-Pagan confirmed the heteroskedasticity in the
# amplification curve data.

par(mfrow = c(1,2), bty = "n")
res <- MFIaggr(VIMCFX96_60[, 1], VIMCFX96_60[, 2:ncol(VIMCFX96_60)], 
	       llul = c(1,10))
head(res)
plot(res[, 1], res[, 3]^2, xlab = "Cycle", ylab = "Variance of refMFI", 
     xlim = c(1,10), main = "ROI from Cycle 1 to 10", pch = 19, type = "b")
abline(v = c(1,10), col = "grey", lty = 2, lwd = 2)
legend("top", paste0("Breusch-Pagan test p-value: \n", format(summary(res)[5], 
       digits = 2)), bty = "n")

res <- MFIaggr(VIMCFX96_60[, 1], VIMCFX96_60[, 2:ncol(VIMCFX96_60)], 
	       llul = c(1,40))
head(res)
plot(res[, 1], res[, 3]^2, xlab = "Cycle", ylab = "Variance of refMFI", 
     main = "ROI from Cycle 1 to 40", pch = 19, type = "b")
abline(v = c(1,40), col = "grey", lty = 2, lwd = 2)
legend("top", paste0("Breusch-Pagan test p-value: \n", format(summary(res)[5], 
       digits = 2)), bty = "n")
par(mfrow = c(1,2))



