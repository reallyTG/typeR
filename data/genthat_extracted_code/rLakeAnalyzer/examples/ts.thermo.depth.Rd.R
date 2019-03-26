library(rLakeAnalyzer)


### Name: ts.thermo.depth
### Title: Calculate physical indices for a timeseries.
### Aliases: ts.thermo.depth
### Keywords: manip

### ** Examples


	#Get the path for the package example file included
	exampleFilePath <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	
	#Load
	sparkling.temp = load.ts(exampleFilePath)
  
  
  #calculate and plot the thermocline depth
	t.d = ts.thermo.depth(sparkling.temp)
	
	plot(t.d$datetime, t.d$thermo.depth, type='l', ylab='Thermocline Depth (m)', xlab='Date')
  



