library(predtoolsTS)


### Name: postp.detrend.sfsm
### Title: Undo detrend(substracting full-means method)
### Aliases: postp.detrend.sfsm

### ** Examples

p <- prep.detrend.sfsm(AirPassengers)
postp.detrend.sfsm(p$tserie,p$means,start(AirPassengers),frequency(AirPassengers))



