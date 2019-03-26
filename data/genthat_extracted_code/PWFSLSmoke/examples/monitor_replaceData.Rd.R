library(PWFSLSmoke)


### Name: monitor_replaceData
### Title: Replace ws_monitor Data with Another Value
### Aliases: monitor_replaceData
### Keywords: ws_monitor

### ** Examples

wa <- monitor_subset(Northwest_Megafires, stateCodes='WA')
wa_zero <- monitor_replaceData(wa, data < 0, 0)



