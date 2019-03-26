library(sampSurf)


### Name: omnibusDLPDSIZ
### Title: Generate Objects of Class "'omnibusDLPDSIZ'"
### Aliases: omnibusDLPDSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=15, solidType=4, logAngle=pi/3, logLen=10, units='English')
pdsEng = perpendicularDistance(kpds=6, units='English')
dlsEng = distanceLimited(2, units='English')
iz.odlpds = omnibusDLPDSIZ(dl, pds=pdsEng, dls=dlsEng)
iz.odlpds



