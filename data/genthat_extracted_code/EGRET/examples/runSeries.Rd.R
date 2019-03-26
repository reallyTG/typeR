library(EGRET)


### Name: runSeries
### Title: Annual series of flow-normalized concentration and
###   flow-normalzed flux
### Aliases: runSeries

### ** Examples

eList <- Choptank_eList

## Not run: 
##D # Automatic calculations based on windowSide=7
##D # four possible ways to do generalized flow normalization
##D 
##D #Option 1:  Use all years for flow normalization.
##D seriesOut_1 <- runSeries(eList,  windowSide = 0)
##D plotConcHist(seriesOut_1)
##D plotFluxHist(seriesOut_1)
##D 
##D # Option 2: Use sliding window throughout the whole flow normalization process.
##D #                In each case it is a 15 year window (15 = 1 + 2*7)
##D seriesOut_2 <- runSeries(eList, windowSide = 7)
##D 
##D plotConcHist(seriesOut_2)
##D plotFluxHist(seriesOut_2)
##D 
##D # Option 3: Flow normalization is based on splitting the flow record at 1990-09-30
##D #                But in years before the break it uses all flow data from before the break, 
##D #                and years after the break uses all flow data after the break
##D seriesOut_3 <- runSeries(eList,
##D                        windowSide = 0, 
##D                        flowBreak = TRUE,
##D                        Q1EndDate = "1990-09-30")
##D                        
##D plotConcHist(seriesOut_3)
##D plotFluxHist(seriesOut_3)
##D 
##D # Option 4: Flow normalization is based on splitting the flow record at 1990-09-30
##D #                but before the break uses a 15 year window of years before the break
##D #                after the break uses a 15 year window of years after the break
##D seriesOut_4 <- runSeries(eList, 
##D                       windowSide = 7, flowBreak = TRUE,
##D                       Q1EndDate = "1990-09-30")
##D                       
##D plotConcHist(seriesOut_4)
##D plotFluxHist(seriesOut_4)
##D 
## End(Not run)



