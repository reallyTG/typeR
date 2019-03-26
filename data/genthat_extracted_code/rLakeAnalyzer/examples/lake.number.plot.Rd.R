library(rLakeAnalyzer)


### Name: lake.number.plot
### Title: Plots time series of Lake Number
### Aliases: lake.number.plot
### Keywords: hplot

### ** Examples


	#Get system data file paths 
	wtr.path <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")
	bth.path <- system.file('extdata', 'Sparkling.bth', package="rLakeAnalyzer")
	wnd.path <- system.file('extdata', 'Sparkling.wnd', package="rLakeAnalyzer")

	#Load data for example lake, Sparkilng Lake, Wisconsin.
	wtr = load.ts(wtr.path)
	wnd = load.ts(wnd.path)
	bth = load.bathy(bth.path)
	wh = 1 # user specified, here as 1 m.
  ## Not run: 
##D   #generate default plot
##D 	lake.number.plot(wtr,wnd,wh,bth)
##D 	
## End(Not run)



