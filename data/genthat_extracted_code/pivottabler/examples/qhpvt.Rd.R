library(pivottabler)


### Name: qhpvt
### Title: Quickly render a basic pivot table in HTML.
### Aliases: qhpvt

### ** Examples

qhpvt(bhmtrains, "TOC", "TrainCategory", "n()")
qhpvt(bhmtrains, "TOC", "TrainCategory",
     c("Mean Speed"="mean(SchedSpeedMPH, na.rm=TRUE)",
       "Std Dev Speed"="sd(SchedSpeedMPH, na.rm=TRUE)"),
     formats=list("%.0f", "%.1f"),
     totals=list("TOC"="All TOCs",
       "TrainCategory"="All Categories"))



