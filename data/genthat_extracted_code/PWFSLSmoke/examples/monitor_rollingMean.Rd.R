library(PWFSLSmoke)


### Name: monitor_rollingMean
### Title: Calculate Rolling Means
### Aliases: monitor_rollingMean
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
wa_smoky <- monitor_subset(N_M, stateCodes='WA', tlim=c(20150801, 20150808), vlim=c(100,Inf))
wa_smoky_3hr <- monitor_rollingMean(wa_smoky, width=3, align="center")
wa_smoky_24hr <- monitor_rollingMean(wa_smoky, width=24, align="right")
monitorPlot_timeseries(wa_smoky, type='l', shadedNight=TRUE)
monitorPlot_timeseries(wa_smoky_3hr, type='l', col='red', add=TRUE)
monitorPlot_timeseries(wa_smoky_24hr, type='l', col='blue', lwd=2, add=TRUE)
legend('topright', c("hourly","3-hourly","24-hourly"),
       col=c('black','red','blue'), lwd=c(1,1,2))
title('Smoky Monitors in Washington -- August, 2015')



