library(eseis)


### Name: time_clip
### Title: Clip time vector.
### Aliases: time_clip
### Keywords: eseis

### ** Examples


## load example data
data(rockfall)

## define limits to clip to
limits <- c(min(rockfall_t) + 10,
            max(rockfall_t) - 10)

## clip data set
rockfall_t_clip <- time_clip(time = rockfall_t, 
                             limits = limits)

## compare time ranges
range(rockfall_t)
range(rockfall_t_clip)
                     



