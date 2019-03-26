library(rcarbon)


### Name: spd2gg
### Title: Compute geometric growth rates from SPDs
### Aliases: spd2gg

### ** Examples

## Not run: 
##D data(emedyd)
##D caldates <- calibrate(x=emedyd$CRA, errors=emedyd$Error, normalised=FALSE, calMatrix=TRUE)
##D bins <- binPrep(sites=emedyd$SiteName, ages=emedyd$CRA, h=50)
##D emedyd.spd <- spd(caldates,bins,timeRange=c(16000,9000))
##D emedyd.gg <- spd2gg(emedyd.spd,breaks=seq(16000,9000,-1000))
##D plot(emedyd.gg)
## End(Not run)



