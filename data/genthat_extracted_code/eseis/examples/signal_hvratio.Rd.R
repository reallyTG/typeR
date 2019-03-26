library(eseis)


### Name: signal_hvratio
### Title: Calculate h-v-ratio of seismic components
### Aliases: signal_hvratio
### Keywords: eseis

### ** Examples

## load example data set
data(earthquake)

## ATTENTION, THIS EXAMPLE DATA SET IS FAR FROM IDEAL FOR THIS PURPOSE

## detrend data
s <- signal_detrend(data = s)

## calculate h-v-ratio, will be very rugged
hv <- signal_hvratio(data = s, 
                     dt = 1 / 200)
plot(hv$ratio, 
     type = "l", 
     log = "y")

## calculate h-v-ratio using the autogressive spectrum method
hv <- signal_hvratio(data = s, 
                     dt = 1 / 200, 
                     method = "autoregressive")
plot(hv, type = "l")

## calculate h-v-ratio with a smoothing window equivalent to dt
hv <- signal_hvratio(data = s, 
                     dt = 1 / 200,
                     kernel = 200)
plot(hv, type = "l")




