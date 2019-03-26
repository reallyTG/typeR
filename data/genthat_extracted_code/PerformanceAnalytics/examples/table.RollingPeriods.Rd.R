library(PerformanceAnalytics)


### Name: table.RollingPeriods
### Title: Rolling Periods Summary: Statistics and Stylized Facts
### Aliases: table.RollingPeriods table.TrailingPeriods
###   table.TrailingPeriodsRel table.TrailingPeriodsRel

### ** Examples


data(edhec)
table.TrailingPeriods(edhec[,10:13], periods=c(12,24,36))

result=table.TrailingPeriods(edhec[,10:13], periods=c(12,24,36))
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
                   cdec=rep(3,dim(result)[2])), rmar = 0.8, cmar = 1.5,  
                   max.cex=.9, halign = "center", valign = "top", row.valign="center", 
                   wrap.rownames=15, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Trailing Period Statistics")




