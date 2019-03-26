library(FIAR)


### Name: hrfConvolve
### Title: Convolution function
### Aliases: hrfConvolve
### Keywords: ~hrf

### ** Examples

# Specify a stimulusfunction without noise and convolve with canonical HRF

hrfConvolve(scans = 240, onsets = c(0,60,120,180), durations = c(30), 
             rt = 3, SNR = 0)

# Convolve a (part of a) timeseries with a canonical HRF.

hrfConvolve(x=grangerdata[1:100,1])
plot(hrfConvolve(grangerdata[1:100,1]))

# Compare the convolved timeseries with the raw
par(mfrow=c(2,1))
plot(x=semdata[1:100,1])
plot(hrfConvolve(x=semdata[1:100,1]))



