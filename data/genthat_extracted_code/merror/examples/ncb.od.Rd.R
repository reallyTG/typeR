library(merror)


### Name: ncb.od
### Title: Compute accuracy estimates and maximum likelihood estimates of
###   precision for the nonconstant bias measurement error model using
###   original data.
### Aliases: ncb.od
### Keywords: htest

### ** Examples


data(pm2.5)
ncb.od(pm2.5)               # nonconstant bias model using original data values
ncb.od(pm2.5,beta=rep(1,5)) # constant bias model using original data values




