library(PWFSLSmoke)


### Name: monitor_subset
### Title: Subset ws_monitor Object
### Aliases: monitor_subset
### Keywords: ws_monitor

### ** Examples

N_M <- monitor_subset(Northwest_Megafires, tlim=c(20150701,20150731))
xlim <- c(-124.73, -122.80)
ylim <- c(47.20, 48.40)
Olympic_Peninsula <- monitor_subset(N_M, xlim, ylim)
monitorMap(Olympic_Peninsula, cex=2)
rect(xlim[1], ylim[1], xlim[2], ylim[2], col=adjustcolor('black',0.1))



