library(PWFSLSmoke)


### Name: monitor_collapse
### Title: Collapse a ws_monitor Object into a ws_monitor Object with a
###   Single Monitor
### Aliases: monitor_collapse
### Keywords: ws_monitor

### ** Examples

N_M <- Northwest_Megafires
# monitorLeaflet(N_M) # to identify Spokane monitorIDs
Spokane <- monitor_subsetBy(N_M, stringr::str_detect(N_M$meta$monitorID,'^53063'))
Spokane_min <- monitor_collapse(Spokane, monitorID='Spokane_min', FUN=min)
Spokane_max <- monitor_collapse(Spokane, monitorID='Spokane_max', FUN=max)
monitorPlot_timeseries(Spokane, tlim=c(20150619,20150626),
                       style='gnats', shadedNight=TRUE)
monitorPlot_timeseries(Spokane_max, col='red', type='s', add=TRUE)
monitorPlot_timeseries(Spokane_min, col='blue', type='s', add=TRUE)
title('Spokane Range of PM2.5 Values, June 2015')



