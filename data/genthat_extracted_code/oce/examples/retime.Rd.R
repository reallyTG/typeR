library(oce)


### Name: retime
### Title: Adjust the time within Oce object
### Aliases: retime

### ** Examples

library(oce)
data(adv)
adv2 <- retime(adv,0,1e-4,as.POSIXct("2008-07-01 00:00:00",tz="UTC"))
plot(adv[["time"]], adv2[["time"]]-adv[["time"]], type='l')



