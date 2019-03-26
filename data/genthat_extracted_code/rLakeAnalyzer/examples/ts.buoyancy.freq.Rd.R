library(rLakeAnalyzer)


### Name: ts.buoyancy.freq
### Title: Calculate the buoyancy (Brunt-Vaisala) frequency for a
###   temperature profile.
### Aliases: ts.buoyancy.freq
### Keywords: arith

### ** Examples



	#Get the path for the package example file included
	wtr.path <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	
	#Load data for example lake, Sparkilng Lake, Wisconsin.
	sp.wtr = load.ts(wtr.path)
	
	N2 = ts.buoyancy.freq(sp.wtr, seasonal=FALSE)
	SN2 = ts.buoyancy.freq(sp.wtr, seasonal=TRUE)
	
	plot(N2, type='l', ylab='Buoyancy Frequency', xlab='Date')
	lines(SN2, col='red')
	



