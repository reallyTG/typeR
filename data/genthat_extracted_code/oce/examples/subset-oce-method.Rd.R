library(oce)


### Name: subset,oce-method
### Title: Subset an oce Object
### Aliases: subset,oce-method

### ** Examples

library(oce)
data(ctd)
# Select just the top 10 metres (pressure less than 10 dbar)
top10 <- subset(ctd, pressure < 10)
par(mfrow=c(1, 2))
plotProfile(ctd)
plotProfile(top10)



