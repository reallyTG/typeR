library(eseis)


### Name: signal_snr
### Title: Calculate signal-to-noise-ratio.
### Aliases: signal_snr
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## calculate snr with detrend option off and on
snr <- signal_snr(data = rockfall_eseis)
print(snr$snr)

snr <- signal_snr(data = rockfall_eseis, 
                  detrend = TRUE)
print(snr$snr)
                     



