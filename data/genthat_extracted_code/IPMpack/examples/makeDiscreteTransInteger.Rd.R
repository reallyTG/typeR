library(IPMpack)


### Name: makeDiscreteTransInteger
### Title: Builds matrix for transitions between discrete (e.g. seedbank,
###   dormant) and continuous (e.g. size) stages, for situation where
###   continuous variable is an integer (e.g. number of leaves).
### Aliases: makeDiscreteTransInteger

### ** Examples

dff <- generateData(type="discrete")
dff$fec[dff$fec==0] <- NA
dff$size <- pmax(floor(dff$size+10),0)
dff$sizeNext <- pmax(floor(dff$sizeNext+10),0)
discTrans <- makeDiscreteTransInteger(dff)
makeIPMPmatrix(nBigMatrix = 10, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), discreteTrans = discTrans)



