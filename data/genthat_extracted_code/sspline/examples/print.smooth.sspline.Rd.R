library(sspline)


### Name: print.smooth.sspline
### Title: Display a Smooth.sspline Object
### Aliases: print.smooth.sspline summary.smooth.sspline
### Keywords: smooth methods

### ** Examples

subdat <- WT6367[sample(nrow(WT6367), 200), 2:4]
attach(subdat)

splobj <- smooth.sspline(lon, lat, avgt)

print(splobj)
summary(splobj)

detach(subdat)



