library(sampSurf)


### Name: omnibusPDSIZ
### Title: Generate Objects of Class "'omnibusPDSIZ'"
### Aliases: omnibusPDSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# creates an inclusion zone object for sampling with probability
# proportional to volume by default...
#
dl = downLog(buttDiam=15, solidType=4, logAngle=pi/3, logLen=10, units='English')
pdsEng = perpendicularDistance(kpds=6, units='English')
iz.opdsv = omnibusPDSIZ(dl, pdsEng)
iz.opdsv



