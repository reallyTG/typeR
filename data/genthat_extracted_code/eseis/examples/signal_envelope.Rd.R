library(eseis)


### Name: signal_envelope
### Title: Calculate signal envelope.
### Aliases: signal_envelope
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## detrend data set
rockfall_detrend <- signal_detrend(data = rockfall_eseis)

## calculate envelope
rockfall_envelope <- signal_envelope(data = rockfall_detrend)

## plot envelope
plot_signal(data = rockfall_envelope)
                     



