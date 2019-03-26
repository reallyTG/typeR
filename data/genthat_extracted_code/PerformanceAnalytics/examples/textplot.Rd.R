library(PerformanceAnalytics)


### Name: replaceTabs.inner
### Title: Display text information in a graphics plot.
### Aliases: replaceTabs.inner replaceTabs textplot textplot.default
###   textplot.character textplot.matrix textplot.data.frame replaceTabs
###   textplot.default textplot.data.frame textplot.matrix
###   textplot.character

### ** Examples


# Also see the examples in the original gplots textplot function
data(managers)
textplot(table.AnnualizedReturns(managers[,1:6]))

# This was really nice before Hmisc messed up 'format' from R-base
# prettify with format.df in hmisc package
# require("Hmisc")
# result = t(table.CalendarReturns(managers[,1:8]))[-1:-12,]

#  textplot(Hmisc::format.df(result, na.blank=TRUE, numeric.dollar=FALSE, 
#           cdec=rep(1,dim(result)[2])), rmar = 0.8, cmar = 1,  max.cex=.9, 
#           halign = "center", valign = "top", row.valign="center", wrap.rownames=20, 
#           wrap.colnames=10, col.rownames=c("red", rep("darkgray",5), 
#           rep("orange",2)), mar = c(0,0,4,0)+0.1)
#
# title(main="Calendar Returns")




