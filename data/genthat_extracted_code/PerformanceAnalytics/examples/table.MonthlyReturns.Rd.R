library(PerformanceAnalytics)


### Name: table.Stats
### Title: Returns Summary: Statistics and Stylized Facts
### Aliases: table.Stats table.MonthlyReturns

### ** Examples


data(edhec)
table.Stats(edhec[,1:3])
t(table.Stats(edhec))

result=t(table.Stats(edhec))
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, cdec=c(rep(1,2),rep(3,14))), 
         rmar = 0.8, cmar = 1.5,  max.cex=.9, halign = "center", valign = "top", 
         row.valign="center", wrap.rownames=10, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Statistics for EDHEC Indexes")




