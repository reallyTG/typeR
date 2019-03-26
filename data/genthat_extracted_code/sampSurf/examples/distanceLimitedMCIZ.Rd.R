library(sampSurf)


### Name: distanceLimitedMCIZ
### Title: Generate Objects of Class "'distanceLimitedMCIZ'"
### Aliases: distanceLimitedMCIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# generate a simple inclusion zone object with distance limit
# of 6 feet...
#
dl = downLog(buttDiam=15, solidType=4, logAngle=pi/3, logLen=10, units='English')
dlsEng = distanceLimited(6, units='English')
iz.dlmcs = distanceLimitedMCIZ(dl, dls=dlsEng)
iz.dlmcs



