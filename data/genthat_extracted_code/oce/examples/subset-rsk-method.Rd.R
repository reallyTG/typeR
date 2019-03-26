library(oce)


### Name: subset,rsk-method
### Title: Subset a Rsk Object
### Aliases: subset,rsk-method

### ** Examples

library(oce)
data(rsk)
plot(rsk)
plot(subset(rsk, time < mean(range(rsk[['time']]))))




