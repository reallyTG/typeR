library(seewave)


### Name: melfilterbank
### Title: Mel-filter bank for MFCC computation
### Aliases: melfilterbank
### Keywords: ts math

### ** Examples

## default values
melfilterbank(plot=TRUE)
## with color surfaces
melfilterbank(palette=cm.colors, plot=TRUE)
## values changed
res <- melfilterbank(f=16000, wl=512, minfreq=300, plot=TRUE)
## plot the 1st filter only
plot(res$freq, res$amp[,1], type="l", xlab="Frequency (kHz)", ylab="Amplitude")
## plot the last filter only
plot(res$freq, res$amp[,ncol(res$amp)], type="l", xlab="Frequency (kHz)", ylab="Amplitude")
## get the kHz central frequencies of the succesive filters
res$central.freq



