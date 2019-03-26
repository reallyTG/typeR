library(PerformanceAnalytics)


### Name: table.Drawdowns
### Title: Worst Drawdowns Summary: Statistics and Stylized Facts
### Aliases: table.Drawdowns

### ** Examples


data(edhec)
table.Drawdowns(edhec[,1,drop=FALSE])
table.Drawdowns(edhec[,12,drop=FALSE])
data(managers)
table.Drawdowns(managers[,8,drop=FALSE])

result=table.Drawdowns(managers[,1,drop=FALSE])

# This was really nice before Hmisc messed up 'format' from R-base
#require("Hmisc")
#textplot(Hmisc::format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
#           cdec=c(rep(3,4), rep(0,3))), rmar = 0.8, cmar = 1.5,  
#           max.cex=.9, halign = "center", valign = "top", row.valign="center", 
#           wrap.rownames=5, wrap.colnames=10, mar = c(0,0,3,0)+0.1) 
# title(main="Largest Drawdowns for HAM1")




