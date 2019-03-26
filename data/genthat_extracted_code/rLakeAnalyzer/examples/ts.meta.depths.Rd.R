library(rLakeAnalyzer)


### Name: ts.meta.depths
### Title: Calculate physical indices for a timeseries.
### Aliases: ts.meta.depths
### Keywords: manip

### ** Examples


	#Get the path for the package example file included
	exampleFilePath <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	
	#Load
	sparkling.temp = load.ts(exampleFilePath)
	
	#calculate and plot the metalimnion depths
	m.d = ts.meta.depths(sparkling.temp)
	
	plot(m.d$datetime, m.d$top, type='l', ylab='Meta Depths (m)', xlab='Date', col='blue')
	lines(m.d$datetime, m.d$bottom, col='red')
  
  



