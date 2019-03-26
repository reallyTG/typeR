library(predtoolsTS)


### Name: postp.detrend.differencing
### Title: Undo detrend(differencing)
### Aliases: postp.detrend.differencing

### ** Examples

p <- prep.detrend.differencing(AirPassengers)
postp.detrend.differencing(p$tserie,p$nd,p$firstvalues)



