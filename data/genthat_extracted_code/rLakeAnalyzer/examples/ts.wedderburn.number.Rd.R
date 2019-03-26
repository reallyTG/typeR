library(rLakeAnalyzer)


### Name: ts.wedderburn.number
### Title: Calculate Wedderburn number for a timeseries.
### Aliases: ts.wedderburn.number
### Keywords: arith

### ** Examples



	#Get the path for the package example file included
	wtr.path <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	wnd.path <- system.file('extdata', 'Sparkling.daily.wnd', package="rLakeAnalyzer")
	bathy.path <- system.file('extdata', 'Sparkling.bth', package="rLakeAnalyzer")
	
	#Load data for example lake, Sparkilng lake, in Wisconsin.
	sp.wtr = load.ts(wtr.path)
	sp.wnd = load.ts(wnd.path)
	sp.bathy = load.bathy(bathy.path)
	
	sp.area = 64e4  #Area of Sparkling lake in m^2
	wnd.height = 2  #Height of Sparkling lake anemometer
	
	w.n = ts.wedderburn.number(sp.wtr, sp.wnd, wnd.height, sp.bathy, sp.area)
	plot(w.n$datetime, w.n$wedderburn.number, type='l', ylab='Wedderburn Number', xlab='Date')
	



