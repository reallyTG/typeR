library(astrolibR)


### Name: lsf_rotate
### Title: Create a 1-d convolution kernel to broaden a spectrum from a
###   rotating star
### Aliases: lsf_rotate
### Keywords: misc

### ** Examples

# Plot the LSF for a star rotating at 90 km/s in both velocity space and
# for a central wavelength of 4300 A.    Compute the LSF every 3 km/s

lsf = lsf_rotate(3,90)      # LSF will contain 61 pts



