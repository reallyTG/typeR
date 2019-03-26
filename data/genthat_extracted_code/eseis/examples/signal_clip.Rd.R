library(eseis)


### Name: signal_clip
### Title: Clip signal based on time vector.
### Aliases: signal_clip
### Keywords: eseis

### ** Examples


## load example data
data(rockfall)

## define limits (second 10 to 20 of the signal)
limits <- c(rockfall_t[1] + 10, rockfall_t[1] + 20)

## clip signal 
rockfall_clip <- signal_clip(data = rockfall_z, 
                             time = rockfall_t, 
                             limits = limits)
                     
## clip signal using the eseis object
rockfall_clip <- signal_clip(data = rockfall_eseis, 
                             limits = limits)
                             



