library(eseis)


### Name: signal_filter
### Title: Filter a seismic signal in the time domain
### Aliases: signal_filter
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## filter data set by bandpass filter between 1 and 90 Hz
rockfall_bp <- signal_filter(data = rockfall_eseis, 
                             f = c(1, 90))
                             
## taper signal to account for edge effects
rockfall_bp <- signal_taper(data = rockfall_bp, 
                            n = 2000)

## plot filtered signal
plot_signal(data = rockfall_bp)
                     



