library(EGRET)


### Name: flexPlotAddOn
### Title: Flexible Flow Normalization Plot Add On
### Aliases: flexPlotAddOn

### ** Examples

eList <- Choptank_eList
eList <- setUpEstimation(eList)
flowNormStart <- c("1979-10-01","1990-01-01","1992-10-10")
flowNormEnd <- c("1995-06-06","2004-03-03","2011-09-29")
flowStart <- c("1979-10-01","1995-06-07","2004-03-04")
flowEnd <- c("1995-06-06","2004-03-03","2011-09-29") 
dateInfo <- data.frame(flowNormStart,
                       flowNormEnd,
                       flowStart, 
                       flowEnd, 
                       stringsAsFactors = FALSE)
## Not run: 
##D newEList <- flexFN(eList, dateInfo)
##D plotFluxHist(newEList)
##D flexPlotAddOn(newEList)
##D 
##D plotFluxHist(newEList)
##D flexPlotAddOn(newEList, customPalette=c("#d5ce48", "#fd300f", "#3e0289"))
## End(Not run)



