library(acnr)


### Name: getMinorMajorCopyNumbers
### Title: Get minor and major copy number labels from region annotation
###   labels
### Aliases: getMinorMajorCopyNumbers

### ** Examples


dat <- loadCnRegionData(dataSet="GSE29172_H1395", tumorFraction=1)
regions <- unique(dat$region)
getMinorMajorCopyNumbers(regions)




