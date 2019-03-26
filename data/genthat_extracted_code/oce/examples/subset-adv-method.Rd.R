library(oce)


### Name: subset,adv-method
### Title: Subset an ADV Object
### Aliases: subset,adv-method

### ** Examples

library(oce)
data(adv)
plot(adv)
plot(subset(adv, time < mean(range(adv[['time']]))))




