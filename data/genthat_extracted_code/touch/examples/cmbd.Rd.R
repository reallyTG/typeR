library(touch)


### Name: cmbd
### Title: Comorbidity measures from AHRQ HCUP
### Aliases: cmbd
### Keywords: manipulation

### ** Examples


data(dxDat)
drg <- dxDat$drg
icd <- dxDat[, -1L]
output <- cmbd(icd, drg=drg)



