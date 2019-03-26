library(rLakeAnalyzer)


### Name: load.ts
### Title: Load timeseries from properly formatted text file.
### Aliases: load.ts
### Keywords: file

### ** Examples


	#Get the path for the package example file included
	exampleFilePath <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")
	
	#Load
	sparkling.temp = load.ts(exampleFilePath)
	
	#calculate and plot the thermocline depth
	t.d = ts.thermo.depth(sparkling.temp)
	
	plot(t.d$datetime, t.d$thermo.depth, type='l', ylab='Thermocline Depth (m)', xlab='Date')



