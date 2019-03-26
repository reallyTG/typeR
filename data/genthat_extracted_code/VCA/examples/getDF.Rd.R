library(VCA)


### Name: getDF
### Title: Extract Degrees of Freedom from Linear Hypotheses of Fixed
###   Effects or LS Means.
### Aliases: getDF

### ** Examples

## Not run: 
##D data(VCAdata1)
##D tmpDat <- VCAdata1[VCAdata1$sample==1,]
##D tmpDat <- tmpDat[-c(11,51,73:76),]
##D fitMM <- anovaMM(y~(lot+device)/(day)/(run), tmpDat)
##D fitMM
##D L <- getL(fitMM, c("lot1-lot2", "device1-device2"))
##D getDF(fitMM, L)						# method="contain" is Default
##D getDF(fitMM, L, method="res")
##D 
##D getDF(fitMM, L, method="satt")		# takes quite long for this model
## End(Not run)



