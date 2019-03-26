library(EGRET)


### Name: fluxBiasStat
### Title: Compute the flux bias statistic: (mean of estimated flux - mean
###   of observed flux) / mean of observed flux
### Aliases: fluxBiasStat
### Keywords: bias statistics, water-quality

### ** Examples

eList <- Choptank_eList
Sample <- getSample(eList)
fluxBias <- fluxBiasStat(Sample) 



