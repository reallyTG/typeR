library(PWFSLSmoke)


### Name: monitorPlot_timeseries
### Title: Create Timeseries Plot
### Aliases: monitorPlot_timeseries
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
# monitorLeaflet(N_M) # to identify Spokane monitorIDs
Spokane <- monitor_subsetBy(N_M, stringr::str_detect(N_M$meta$monitorID,'^53063'))
monitorPlot_timeseries(Spokane, style='gnats')
title('Spokane PM2.5 values, 2015')
monitorPlot_timeseries(Spokane, tlim=c(20150801,20150831), style='aqidots', pch=16)
addAQILegend()
title('Spokane PM2.5 values, August 2015')
monitorPlot_timeseries(Spokane, tlim=c(20150821,20150828), shadedNight=TRUE, style='gnats')
abline(h=AQI$breaks_24, col=AQI$colors, lwd=2)
addAQILegend()
title('Spokane PM2.5 values, August 2015')



