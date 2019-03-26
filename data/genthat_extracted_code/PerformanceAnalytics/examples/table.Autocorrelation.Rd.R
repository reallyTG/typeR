library(PerformanceAnalytics)


### Name: table.Autocorrelation
### Title: table for calculating the first six autocorrelation coefficients
###   and significance
### Aliases: table.Autocorrelation

### ** Examples


data(managers)
t(table.Autocorrelation(managers))

result = t(table.Autocorrelation(managers[,1:8]))

textplot(result, rmar = 0.8, cmar = 2,  max.cex=.9, halign = "center", 
         valign = "top", row.valign="center", wrap.rownames=15, 
         wrap.colnames=10, mar = c(0,0,3,0)+0.1)
         
title(main="Autocorrelation")




