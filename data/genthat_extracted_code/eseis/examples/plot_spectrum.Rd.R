library(eseis)


### Name: plot_spectrum
### Title: Plot a spectrum of a seismic signal
### Aliases: plot_spectrum
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## calculate spectrum
spectrum_rockfall <- signal_spectrum(data = rockfall_eseis)

## plot data set with lower resolution
plot_spectrum(data = spectrum_rockfall)




