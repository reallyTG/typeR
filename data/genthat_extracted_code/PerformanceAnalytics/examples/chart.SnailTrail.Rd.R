library(PerformanceAnalytics)


### Name: chart.SnailTrail
### Title: chart risk versus return over rolling time periods
### Aliases: chart.SnailTrail

### ** Examples


data(managers)
chart.SnailTrail(managers[,c("HAM2","SP500 TR"),drop=FALSE], 
		width=36, stepsize=12, 
		colorset=c('red','orange'),
		add.names="firstandlast", 
		rf=.04/12, 
		main="Trailing 36-month Performance Calc'd Every 12 Months")





