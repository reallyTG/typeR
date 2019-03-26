library(oce)


### Name: subset,met-method
### Title: Subset a met Object
### Aliases: subset,met-method

### ** Examples

library(oce)
data(met)
# Few days surrounding Hurricane Juan
plot(subset(met, time > as.POSIXct("2003-09-27", tz="UTC")))




