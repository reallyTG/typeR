library(sampSurf)


### Name: hybridDLPDSIZ
### Title: Generate Objects of Class "'hybridDLPDSIZ'"
### Aliases: hybridDLPDSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=15, solidType=4, logAngle=pi/3, logLen=10, units='English')
pdsEng = perpendicularDistance(kpds=6, units='English')
dlsEng = distanceLimited(2, units='English')
iz.hdlpds = hybridDLPDSIZ(dl, pds=pdsEng, dls=dlsEng)
iz.hdlpds



