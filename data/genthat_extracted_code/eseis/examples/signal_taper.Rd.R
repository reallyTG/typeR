library(eseis)


### Name: signal_taper
### Title: Taper a signal vector.
### Aliases: signal_taper
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## remove mean from data set
rockfall <- signal_demean(data = rockfall_eseis)

## create artefact at the beginning
rockfall_eseis$signal[1:100] <- runif(n = 100, min = -5000, max = 5000)

## taper signal
rockfall_taper <- signal_taper(data = rockfall, n = 1000)

## plot both data sets
plot_signal(data = rockfall_eseis)
plot_signal(rockfall_taper)
                     



