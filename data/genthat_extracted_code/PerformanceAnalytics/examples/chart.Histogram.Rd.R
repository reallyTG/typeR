library(PerformanceAnalytics)


### Name: chart.Histogram
### Title: histogram of returns
### Aliases: chart.Histogram

### ** Examples


    data(edhec)
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE])

    # version with more breaks and the 
	   # standard close fit density distribution
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			breaks=40, methods = c("add.density", "add.rug") )

    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			methods = c( "add.density", "add.normal") )

    # version with just the histogram and 
    # normal distribution centered on 0
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			methods = c( "add.density", "add.centered") )

    # add a rug to the previous plot 
	   # for more granularity on precisely where the distribution fell
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			methods = c( "add.centered", "add.density", "add.rug") )

    # now show a qqplot to give us another view 
    # on how normal the data are
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			methods = c("add.centered","add.density","add.rug","add.qqplot"))

    # add risk measure(s) to show where those are 
	   # in relation to observed returns
    chart.Histogram(edhec[,'Equity Market Neutral',drop=FALSE], 
			methods = c("add.density","add.centered","add.rug","add.risk"))




