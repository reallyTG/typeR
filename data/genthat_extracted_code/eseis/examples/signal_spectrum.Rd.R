library(eseis)


### Name: signal_spectrum
### Title: Calculate the spectrum of a time series
### Aliases: signal_spectrum
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## calculate spectrum with standard setup
s <- signal_spectrum(data = rockfall_eseis)

## plot spectrum
plot_spectrum(data = s)




