library(PerformanceAnalytics)


### Name: table.CalendarReturns
### Title: Monthly and Calendar year Return table
### Aliases: table.CalendarReturns table.Returns

### ** Examples


data(managers)
t(table.CalendarReturns(managers[,c(1,7,8)]))

# prettify with format.df in hmisc package
require("Hmisc")
result = t(table.CalendarReturns(managers[,c(1,8)]))

textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
         cdec=rep(1,dim(result)[2])), rmar = 0.8, cmar = 1,  
         max.cex=.9, halign = "center", valign = "top", 
         row.valign="center", wrap.rownames=20, wrap.colnames=10, 
         col.rownames=c( rep("darkgray",12), "black", "blue"), 
         mar = c(0,0,3,0)+0.1)
         
title(main="Calendar Returns")




