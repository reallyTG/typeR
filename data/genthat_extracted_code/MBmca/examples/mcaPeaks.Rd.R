library(MBmca)


### Name: mcaPeaks
### Title: Function to estimate the approximate local minima and maxima of
###   melting curve data.
### Aliases: mcaPeaks
### Keywords: peaks smooth

### ** Examples

# First Example
data(DMP)
# Smooth and Min-Max normalize melting curve data with mcaSmoother()
tmp <- mcaSmoother(DMP[, 1], DMP[,6], minmax = TRUE, n = 2)

# Extract the first derivative melting curve data
tmp.d <- diffQ(tmp, verbose = TRUE)$xy

# Determine the approximate local minima and maxima of a curve
peak.val <-mcaPeaks(tmp.d[, 1], tmp.d[, 2])
peak.val

# Plot the first derivative melting curve
# Add a horizontal line and points for the approximate local minima
# and maxima to the plot
plot(tmp.d, type = "l",
     main = "Show the approximate local minima and maxima of a curve")
  abline(h = 0)
  points(peak.val$p.min, col = 1, pch = 19)
  points(peak.val$p.max, col = 2, pch = 19)
  legend(25, 0.08, c("Minima", "Maxima"), col = c(1,2), pch = c(19,19))

# Second example
# Signifcant peaks can be distinguished by peak hight
plot(tmp.d, type = "l",
      main = "Show the approximate local minima and maxima of a curve")
  abline(h = 0)
  points(peak.val$p.min, col = 1, pch = 19)
  points(peak.val$p.max, col = 2, pch = 19)
  legend(25, 0.08, c("Minima", "Maxima"), col = c(1,2), pch = c(19,19))

# Test which local maxima peak is above the median + 3 * Median Absolute
# Add a threshold (th) line to the plot
th.max <- median(peak.val$p.max[, 2]) + 3 * mad(peak.val$p.max[, 2])
abline(h = th.max, col = 3)

# add the approximate temperatures of the local minima and
# maxima to the plot
T.val <- c(peak.val$p.min[, 1], peak.val$p.max[, 1])
text(T.val, rep(-0.05, length(T.val)), round(T.val,0))

# Use a temperature range from the plot to calculate the Tm of
# the maximum Trange is used between 37 and 74 degree Celsius

tmp <- mcaSmoother(DMP[, 1], DMP[, 6], minmax = TRUE, Trange = c(37,74),
		    n = 2)
# Tm 48.23, fluoTm 0.137
diffQ(tmp, fct = max, plot = TRUE)



