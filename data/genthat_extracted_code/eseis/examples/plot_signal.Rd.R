library(eseis)


### Name: plot_signal
### Title: Plot a seismic signal
### Aliases: plot_signal
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## plot data set straightforward
plot_signal(data = rockfall_eseis)

## plot data set with lower resolution
plot_signal(data = rockfall_eseis, n = 100)




