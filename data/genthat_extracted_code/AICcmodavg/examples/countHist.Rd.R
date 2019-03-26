library(AICcmodavg)


### Name: countHist
### Title: Compute Summary Statistics from Count Histories
### Aliases: countHist countHist.default countHist.unmarkedFramePCount
###   countHist.unmarkedFitPCount countHist.unmarkedFrameGPC
###   countHist.unmarkedFitGPC countHist.unmarkedFrameMPois
###   countHist.unmarkedFitMPois countHist.unmarkedFramePCO
###   countHist.unmarkedFitPCO countHist.unmarkedFrameGMM
###   countHist.unmarkedFitGMM print.countHist
### Keywords: models

### ** Examples

##modified example from ?pcount
## Not run: 
##D if(require(unmarked)){
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D ##compute descriptive stats from data object
##D countHist(mallardUMF)
##D 
##D ##run single season model
##D fm.mallard <- pcount(~ ivel+ date + I(date^2) ~ length + elev +
##D                      forest, mallardUMF, K=30)
##D ##compute descriptive stats from model object
##D countHist(fm.mallard)
##D }
## End(Not run)



