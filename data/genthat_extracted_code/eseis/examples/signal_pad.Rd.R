library(eseis)


### Name: signal_pad
### Title: Pad signal with zeros.
### Aliases: signal_pad
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## pad with zeros
rockfall_pad <- signal_pad(data = rockfall_eseis)

## compare lengths
rockfall_eseis$meta$n
rockfall_pad$meta$n
                     



