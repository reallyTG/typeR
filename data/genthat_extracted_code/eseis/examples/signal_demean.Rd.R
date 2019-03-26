library(eseis)


### Name: signal_demean
### Title: Remove mean of signal vector.
### Aliases: signal_demean
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## remove mean from data set
rockfall_demean <- signal_demean(data = rockfall_eseis)

## compare data ranges
range(rockfall_eseis$signal)
range(rockfall_demean$signal)

## show mean of initial signal
mean(rockfall_eseis$signal)
                     



