library(EGRET)


### Name: fixSampleFrame
### Title: Update Sample dataframe
### Aliases: fixSampleFrame
### Keywords: WRTDS flow

### ** Examples

eList <- Choptank_eList
Sample <- eList$Sample
Sample[1,c("ConcLow","ConcHigh")] <- c(NA, 0.01) # Adjusted to left-censored
Sample[2,c("ConcLow","ConcHigh")] <- c(1.1, 1.3) # Adjusted to interval-censored
Sample[3,c("ConcLow","ConcHigh")] <- c(1.3, 1.3) # Simple adjustment
eList$Sample <- Sample
eList <- fixSampleFrame(eList)
eList$Sample[1:3,]



