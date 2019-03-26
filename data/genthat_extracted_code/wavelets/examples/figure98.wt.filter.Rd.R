library(wavelets)


### Name: figure98.wt.filter
### Title: Plot a DWT Wavelet or Scaling Filter for Specific Levels.
### Aliases: figure98.wt.filter
### Keywords: ts

### ** Examples

# Plotting LA8 Wavelet Filter Coefficients Levels 1 through 7.
filter <- wt.filter()
figure98.wt.filter(filter)

# Alternatively
figure98.wt.filter("la8")

# Plotting D4 Scaling Filter Coefficients Levels 1, 3, and 5 and not
# vertically normalizing each level to its plotting region.
figure98.wt.filter("d4", levels = c(1,3,5), wavelet = FALSE, y.normalize
= FALSE)



