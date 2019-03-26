library(PerformanceAnalytics)


### Name: table.HigherMoments
### Title: Higher Moments Summary: Statistics and Stylized Facts
### Aliases: table.HigherMoments

### ** Examples


data(managers)
table.HigherMoments(managers[,1:3],managers[,8,drop=FALSE])
result=t(table.HigherMoments(managers[,1:6],managers[,8,drop=FALSE]))
rownames(result)=colnames(managers[,1:6])
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
         cdec=rep(3,dim(result)[2])), rmar = 0.8, cmar = 1.5,  
         max.cex=.9, halign = "center", valign = "top", row.valign="center", 
         wrap.rownames=5, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Higher Co-Moments with SP500 TR")




