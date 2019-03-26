library(predtoolsTS)


### Name: postp.deseason.differencing
### Title: Undo deseason(differencing)
### Aliases: postp.deseason.differencing

### ** Examples

p <- prep.deseason.differencing(AirPassengers)
postp.deseason.differencing(p$tserie,p$nsd,p$firstseasons,frequency(AirPassengers))



