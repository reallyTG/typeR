library(pivottabler)


### Name: qpvt
### Title: Quickly build a basic pivot table.
### Aliases: qpvt

### ** Examples

qpvt(bhmtrains, "TOC", "TrainCategory", "n()")
qpvt(bhmtrains, c("=", "TOC"), c("TrainCategory", "PowerType"),
     c("Number of Trains"="n()",
       "Maximum Speed"="max(SchedSpeedMPH, na.rm=TRUE)"))



