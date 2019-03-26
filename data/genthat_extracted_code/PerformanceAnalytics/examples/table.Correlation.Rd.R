library(PerformanceAnalytics)


### Name: table.Correlation
### Title: calculate correlalations of multicolumn data
### Aliases: table.Correlation

### ** Examples


# First we load the data
data(managers)
table.Correlation(managers[,1:6],managers[,7:8])

result=table.Correlation(managers[,1:6],managers[,8])
rownames(result)=colnames(managers[,1:6])
require("Hmisc")
textplot(format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
         cdec=rep(3,dim(result)[2])), rmar = 0.8, cmar = 1.5,  
         max.cex=.9, halign = "center", valign = "top", row.valign="center"
         , wrap.rownames=20, wrap.colnames=10, mar = c(0,0,3,0)+0.1)
title(main="Correlations to SP500 TR")

ctable = table.Correlation(managers[,1:6],managers[,8,drop=FALSE], conf.level=.99)
dotchart(ctable[,1],labels=rownames(ctable),xlim=c(-1,1))




