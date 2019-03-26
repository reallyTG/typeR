library(MBmca)


### Name: MFIerror
### Title: Multiple comparison of the temperature dependent variance of the
###   refMFI
### Aliases: MFIerror
### Keywords: deviation

### ** Examples

# First Example
# Temperature dependent variance of the refMFI using standard measures
# (Mean, Standard Deviation (SD)).
# Use Standard Deviation (SD) in the plot

data(MultiMelt)
MFIerror(MultiMelt[, 1], MultiMelt[, c(2L:13)])

# Second Example
# Temperature dependent relative variance of the refMFI using robust
# measures (Median, Median Absolute Deviation (MAD)). The parameter
# errplot is set to FALSE in order to prevent the plot of the
# coefficient of variation versus the temperature.

MFIerror(MultiMelt[, 1], MultiMelt[, c(2L:13)], errplot = FALSE,
	  RSD = TRUE, rob = TRUE)

# Third Example
# Temperature dependent relative variance of the refMFI using
# robust measures (Median, Median Absolute Deviation (MAD)).
MFIerror(MultiMelt[, 1], MultiMelt[, c(2L:13)], RSD = TRUE,
  rob = TRUE)



