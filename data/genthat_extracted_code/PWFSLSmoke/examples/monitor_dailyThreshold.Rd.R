library(PWFSLSmoke)


### Name: monitor_dailyThreshold
### Title: Calculate Daily Counts of Values At or Above a Threshold
### Aliases: monitor_dailyThreshold
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D N_M <- monitor_subset(Northwest_Megafires, tlim=c(20150801,20150831))
##D Twisp <- monitor_subset(N_M, monitorIDs='530470009_01')
##D Twisp_daily <- monitor_dailyThreshold(Twisp, "unhealthy", dayStart='midnight', minHours=1)
##D monitorPlot_timeseries(Twisp_daily, type='h', lwd=6, ylab="Hours")
##D title("Twisp, Washington Hours per day Above 'Unhealthy', 2015")
## End(Not run)



