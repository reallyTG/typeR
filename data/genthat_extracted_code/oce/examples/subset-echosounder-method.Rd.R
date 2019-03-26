library(oce)


### Name: subset,echosounder-method
### Title: Subset an Echosounder Object
### Aliases: subset,echosounder-method

### ** Examples

library(oce)
data(echosounder)
plot(echosounder)
plot(subset(echosounder, depth < 10))
plot(subset(echosounder, time < mean(range(echosounder[['time']]))))




