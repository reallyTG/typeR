library(PWFSLSmoke)


### Name: monitor_timeAverage
### Title: Calculate Time Averages
### Aliases: monitor_timeAverage
### Keywords: ws_monitor

### ** Examples

C_V <- monitor_subset(Carmel_Valley, tlim=c(2016080800,2016081023),
                      timezone='America/Los_Angeles')
C_V_3hourly <- monitor_timeAverage(C_V, avg.time="3 hour")
head(C_V$data, n=15)
head(C_V_3hourly$data, n=5)



