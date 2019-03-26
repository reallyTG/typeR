library(PWFSLSmoke)


### Name: monitorPlot_hourlyBarplot
### Title: Create Hourly Barplot
### Aliases: monitorPlot_hourlyBarplot
### Keywords: ws_monitor

### ** Examples

C_V <- monitor_subset(Carmel_Valley, tlim=c(2016080800,2016081023),
                      timezone='America/Los_Angeles')
monitorPlot_hourlyBarplot(C_V, main='1-Hourly Average PM2.5',
                          labels_x_nudge=1, labels_y_nudge=0)



