library(AdaptGauss)


### Name: OptimalNoBins
### Title: Optimal Number Of Bins
### Aliases: OptimalNoBins
### Keywords: histogram bins kernel density estimation

### ** Examples
 
 Data = c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
 optNrOfBins = OptimalNoBins(Data)
 minData = min(Data,na.rm = TRUE)
 maxData = max(Data,na.rm = TRUE)
 i = maxData-minData
 optBreaks = seq(minData, maxData, i/optNrOfBins) # bins in fixed intervals
 hist(Data, breaks=optBreaks)



