library(PerformanceAnalytics)


### Name: table.SFM
### Title: Single Factor Asset-Pricing Model Summary: Statistics and
###   Stylized Facts
### Aliases: table.SFM table.CAPM

### ** Examples


data(managers)
table.SFM(managers[,1:3], managers[,8], Rf = managers[,10])

result = table.SFM(managers[,1:3], managers[,8], Rf = managers[,10])
textplot(result, rmar = 0.8, cmar = 1.5,  max.cex=.9, 
         halign = "center", valign = "top", row.valign="center", 
         wrap.rownames=15, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Single Factor Model Related Statistics")




