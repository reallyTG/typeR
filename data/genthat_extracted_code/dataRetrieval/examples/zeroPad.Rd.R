library(dataRetrieval)


### Name: zeroPad
### Title: Pad string with leading zeros
### Aliases: zeroPad
### Keywords: USGS data import service web

### ** Examples

pCode <- '10'
correctPCode <- zeroPad(pCode,5)
pCodes <- c('100','1000','0','12345','1565465465465465')
correctPCodes <- zeroPad(pCodes,5)
pCodeNA <- c(1,2,NA)
padPCodeNA <- zeroPad(pCodeNA,4)



