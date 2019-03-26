library(PWFSLSmoke)


### Name: monitorPlot_rollingMean
### Title: Create Rolling Mean Plot
### Aliases: monitorPlot_rollingMean
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
Roseburg <- monitor_subset(N_M, tlim=c(20150821, 20150831),
                           monitorIDs=c('410190002_01'))
monitorPlot_rollingMean(Roseburg, shadedNight=TRUE)



