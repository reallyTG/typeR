library(oce)


### Name: subset,sealevel-method
### Title: Subset a Sealevel Object
### Aliases: subset,sealevel-method

### ** Examples

library(oce)
data(sealevel)
plot(sealevel)
plot(subset(sealevel, time < mean(range(sealevel[['time']]))))




