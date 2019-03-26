library(staRdom)


### Name: abs_fit_slope
### Title: Fit absorbance data to exponential curve. 'drm' is used for the
###   fitting process.
### Aliases: abs_fit_slope

### ** Examples

data(abs_data)
abs_fit_slope(abs_data$wavelength,abs_data$sample1,lim=c(350,400),l_ref=350)



