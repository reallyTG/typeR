library(phonTools)


### Name: pwelch
### Title: Welch's Power Spectral Density Estimate
### Aliases: pwelch

### ** Examples


## make a sine wave
sinewave = sinusoid (f = 300, fs = 1000, dur = 2000, sum = FALSE)

## add noise
sinewave = sinewave[,2] + rnorm (length (sinewave[,2]), 0, 3)

## compare the results of pwelch() and spectralslice()
par (mfrow = c(2,1), mar = c(4,4,1,1))
spectralslice (sinewave, fs = 1000)
pwelch (sinewave, points = 400, fs = 1000)




