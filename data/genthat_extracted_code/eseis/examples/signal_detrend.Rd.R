library(eseis)


### Name: signal_detrend
### Title: Detrend a signal vector.
### Aliases: signal_detrend
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## remove linear trend from data set
rockfall_detrend <- signal_detrend(data = rockfall_eseis)

## compare data ranges
range(rockfall_eseis$signal)
range(rockfall_detrend$signal)
                     



