library(unmarked)


### Name: unmarkedFrame-class
### Title: Class "unmarkedFrame"
### Aliases: unmarkedFrame-class coordinates,unmarkedFrame-method
###   coordinates coords getY getY,unmarkedFrame-method
###   head,unmarkedFrame-method hist,unmarkedFrameDS-method mapInfo
###   numSites numSites,unmarkedFrame-method numY numY,unmarkedFrame-method
###   obsCovs,unmarkedFrame-method obsCovs<-,unmarkedFrame-method obsCovs
###   obsCovs<- obsNum,unmarkedFrame-method obsNum
###   obsToY,unmarkedFrame-method obsToY<-,unmarkedFrame-method obsToY
###   obsToY<- plot,unmarkedFrame,missing-method powerAnalysis
###   powerAnalysis,formula,unmarkedFramePCount,numeric-method
###   projection,unmarkedFrame-method projection
###   siteCovs,unmarkedFrame-method siteCovs<-,unmarkedFrame-method
###   siteCovs siteCovs<- unmarkedFrameOccu-class unmarkedFrameMPois-class
###   unmarkedFramePCount-class unmarkedFrameDS-class
###   unmarkedMultFrame-class unmarkedFramePCO-class unmarkedFrameGMM-class
###   unmarkedFrameGDS-class unmarkedFrameGPC-class
###   show,unmarkedFrame-method show,unmarkedMultFrame-method
###   summary,unmarkedFrame-method summary,unmarkedFrameDS-method
###   summary,unmarkedMultFrame-method
### Keywords: classes

### ** Examples


# Organize data for pcount()
data(mallard)
mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
	obsCovs = mallard.obs)


# Vizualize it
plot(mallardUMF)

mallardUMF


# Summarize it
summary(mallardUMF)

str(mallardUMF)

numSites(mallardUMF)

numY(mallardUMF)

obsNum(mallardUMF)


# Extract components of data
getY(mallardUMF)

obsCovs(mallardUMF)
obsCovs(mallardUMF, matrices = TRUE)

siteCovs(mallardUMF)

mallardUMF[1:5,]	# First 5 rows in wide format

mallardUMF[,1:2]	# First 2 observations






