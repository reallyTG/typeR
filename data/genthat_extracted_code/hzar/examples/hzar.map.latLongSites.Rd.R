library(hzar)


### Name: hzar.map.latLongSites
### Title: Generate a table of site locations.
### Aliases: hzar.map.latLongSites hzar.map.latLongSites.dms
###   hzar.map.distanceFromSite

### ** Examples


a=hzar.map.latLongSites(c("Norway"),60.4,11)
b=hzar.map.latLongSites.dms(c("Norway","Sweden"),c("60-24 N 11 E","58 N 15 E"))
hzar.map.distanceFromSite(b,"Norway")



