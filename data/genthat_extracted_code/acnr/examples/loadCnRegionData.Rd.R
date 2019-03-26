library(acnr)


### Name: loadCnRegionData
### Title: loadCnRegionData
### Aliases: loadCnRegionData

### ** Examples


affyDat <- loadCnRegionData(dataSet="GSE29172_H1395", tumorFraction=1)
str(affyDat)

illuDat <- loadCnRegionData(dataSet="GSE11976_CRL2324", tumorFraction=.79)
str(illuDat)

affyDat2 <- loadCnRegionData(dataSet="GSE13372_HCC1143", tumorFraction=1)
str(affyDat2)




