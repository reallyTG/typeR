library(PerformanceAnalytics)


### Name: table.CaptureRatios
### Title: Calculate and display a table of capture ratio and related
###   statistics
### Aliases: table.CaptureRatios table.UpDownRatios table.UpDownRatios

### ** Examples


data(managers)
table.CaptureRatios(managers[,1:6], managers[,7,drop=FALSE])
table.UpDownRatios(managers[,1:6], managers[,7,drop=FALSE])

result = t(table.UpDownRatios(managers[,1:6], managers[,7,drop=FALSE])) 
colnames(result)=colnames(managers[,1:6])
textplot(result, rmar = 0.8, cmar = 1.5,  max.cex=.9, 
         halign = "center", valign = "top", row.valign="center", 
         wrap.rownames=15, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
         
title(main="Capture Ratios for EDHEC LS EQ")




