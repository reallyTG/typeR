library(MBmca)


### Name: diffQ
### Title: Calculation of the melting temperature (Tm) from the first
###   derivative
### Aliases: diffQ
### Keywords: Tm melting

### ** Examples

# First Example
# Plot the first derivative of different samples for single melting curve
# data. Note that the argument "plot" is TRUE.

data(MultiMelt)
par(mfrow = c(1,2))
sapply(2L:14, function(i) {
        tmp <- mcaSmoother(MultiMelt[, 1], MultiMelt[, i])
        diffQ(tmp, plot = TRUE)
  }
)
par(mfrow = c(1,1))
# Second example
# Plot the first derivative of different samples from MultiMelt
# in a single plot.
data(MultiMelt)

# First create an empty plot
plot(NA, NA, xlab = "Temperature", ylab ="-d(refMFI)/d(T)",
        main = "Multiple melting peaks in a single plot", xlim = c(65,85),
        ylim = c(-0.4,0.01), pch = 19, cex = 1.8)
# Prepossess the selected melting curve data (2,6,12) with mcaSmoother
# and apply them to diffQ. Note that the argument "plot" is FALSE
# while other arguments like derivlimitsline or peak are TRUE.
sapply(c(2,6,12), function(i) {
	tmp <- mcaSmoother(MultiMelt[, 1], MultiMelt[, i],
			    bg = c(41,61), bgadj = TRUE)
	diffQ(tmp, plot = FALSE, derivlimitsline = TRUE, deriv = TRUE,
	      peak = TRUE, derivlimits = TRUE, col = i, vertiline = TRUE)
  }
)
legend(65, -0.1, colnames(MultiMelt[, c(2,6,12)]), pch = c(15,15,15),
	col = c(2,6,12))

# Third example
# First create an empty plot
plot(NA, NA, xlim = c(50,85), ylim = c(-0.4,2.5),
     xlab = "Temperature",
     ylab ="-refMFI(T) | refMFI'(T) | refMFI''(T)",
     main = "1st and 2nd Derivatives",
     pch = 19, cex = 1.8)

# Prepossess the selected melting curve data with mcaSmoother
# and apply them to diffQ and diffQ2. Note that
# the argument "plot" is FALSE while other
# arguments like derivlimitsline or peak are TRUE.

tmp <- mcaSmoother(MultiMelt[, 1], MultiMelt[, 2],
		    bg = c(41,61), bgadj = TRUE)
lines(tmp, col= 1, lwd = 2)

# Note the different use of the argument derivlimits in diffQ and diffQ2
diffQ(tmp, fct = min, derivlimitsline = TRUE, deriv = TRUE,
	    peak = TRUE, derivlimits = FALSE, col = 2, vertiline = TRUE)
diffQ2(tmp, fct = min, derivlimitsline = TRUE, deriv = TRUE,
	    peak = TRUE, derivlimits = TRUE, col = 3, vertiline = TRUE)

# Add a legend to the plot
legend(65, 1.5, c("Melting curve",
		  "1st Derivative",
		  "2nd Derivative"),
		  pch = c(19,19,19), col = c(1,2,3))

# Fourth example
# Different curves may potentially have different quality in practice.
# For example, using data from MultiMelt should return a
# valid result and plot.
data(MultiMelt)

diffQ(cbind(MultiMelt[, 1], MultiMelt[, 2]), plot = TRUE)$Tm
# limits_xQ
#  77.88139

# Imagine an experiment that went terribly wrong. You would
# still get an estimate for the Tm. The output from diffQ,
# with an error attached, lets the user know that this Tm
# is potentially meaningless. diffQ() will give several
# warning messages.

set.seed(1)
y = rnorm(55,1.5,.8)
diffQ(cbind(MultiMelt[, 1],y), plot = TRUE)$Tm

# The distribution of the curve data indicates noise.
# The data should be visually inspected with a plot
# (see examples of diffQ). The Tm calculation (fit,
# adj. R squared ~ 0.157, NRMSE ~ 0.279) is not optimal
# presumably due to noisy data. Check raw melting
# curve (see examples of diffQ).
# Calculated Tm
#      56.16755


# Sixth example
# Curves may potentially have a low temperature resolution. The rsm
# parameter can be used to double the temperature resolution.
# Use data from MultiMelt column 15 (MLC2v2).
data(MultiMelt)
tmp <- cbind(MultiMelt[, 1], MultiMelt[, 15])

# Use diffQ without and with the rsm parameter and plot
# the results in a single row
par(mfrow = c(1,2))

diffQ(tmp, plot = TRUE)$Tm
  text(60, -0.15, "without rsm parameter")

diffQ(tmp, plot = TRUE, rsm = TRUE)$Tm
  text(60, -0.15, "with rsm parameter")
par(mfrow = c(1,1))



