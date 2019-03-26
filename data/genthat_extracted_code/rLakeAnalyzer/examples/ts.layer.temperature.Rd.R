library(rLakeAnalyzer)


### Name: ts.layer.temperature
### Title: Calculate volume-weighted average water temperature across a
###   range of depths for a timeseries.
### Aliases: ts.layer.temperature
### Keywords: arith

### ** Examples



	#Get the path for the package example file included
	wtr.path <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	bathy.path <- system.file('extdata', 'Sparkling.bth', package="rLakeAnalyzer")
	
	#Load data for example lake, Sparkilng lake, in Wisconsin.
	sp.wtr = load.ts(wtr.path)
	sp.bathy = load.bathy(bathy.path)
	
	
    l.t = ts.layer.temperature(sp.wtr, 0, 18, sp.bathy)
	plot(l.t$datetime, l.t$layer.temp, type='l', 
        ylab='Volumetrically averaged lake temperature', xlab='Date')
	



