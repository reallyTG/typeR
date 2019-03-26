library(wavelets)


### Name: squaredgain.wt.filter
### Title: Plot Squared Gain Function for Wavelet Filter
### Aliases: squaredgain.wt.filter
### Keywords: ts

### ** Examples

# Plotting the squared gain function of LA8 Wavelet Filter Coefficients.
filter <- wt.filter("la8")
squaredgain.wt.filter(filter)

# Plotting the squared gain function of LA8 Scaling Filter Coefficients.
squaredgain.wt.filter(filter, wavelet = FALSE)

# Plotting the squared gain function of Haar Wavelet Filter Coefficients
# without supplying a filter object.
squaredgain.wt.filter("haar")



