library(PerformanceAnalytics)


### Name: table.DownsideRisk
### Title: Downside Risk Summary: Statistics and Stylized Facts
### Aliases: table.DownsideRisk

### ** Examples


data(edhec)
table.DownsideRisk(edhec, Rf=.04/12, MAR =.05/12, p=.95)

result=t(table.DownsideRisk(edhec, Rf=.04/12, MAR =.05/12, p=.95))
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
         cdec=rep(3,dim(result)[2])), rmar = 0.8, cmar = 1.5,  
         max.cex=.9, halign = "center", valign = "top", row.valign="center", 
         wrap.rownames=15, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Downside Risk Statistics")




