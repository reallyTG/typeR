library(unmarked)


### Name: [-methods
### Title: Methods for bracket extraction [ in Package 'unmarked'
### Aliases: [-methods [,unmarkedEstimateList,ANY,ANY,ANY-method
###   [,unmarkedFit,ANY,ANY,ANY-method
###   [,unmarkedFrame,missing,numeric,missing-method
###   [,unmarkedFrame,numeric,missing,missing-method
###   [,unmarkedFrame,numeric,numeric,missing-method
###   [,unmarkedMultFrame,missing,numeric,missing-method
###   [,unmarkedMultFrame,numeric,missing,missing-method
###   [,unmarkedFrameGMM,numeric,missing,missing-method
###   [,unmarkedFrameGDS,numeric,missing,missing-method
###   [,unmarkedFramePCO,numeric,missing,missing-method
###   [,unmarkedFramePCO,missing,numeric,missing-method
###   [,unmarkedFrameGPC,numeric,missing,missing-method
###   [,unmarkedFrameGPC,missing,numeric,missing-method
###   [,unmarkedFrame,list,missing,missing-method
### Keywords: methods

### ** Examples


data(mallard)
mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
	obsCovs = mallard.obs)
summary(mallardUMF)

mallardUMF[1:5,]
mallardUMF[,1:2]
mallardUMF[1:5, 1:2]




