library(rLakeAnalyzer)


### Name: schmidt.plot
### Title: Creates a time series plot of Schmidt's stability
### Aliases: schmidt.plot
### Keywords: hplot

### ** Examples


	# Get system data file paths 
  wtr.path <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")
	bth.path <- system.file('extdata', 'Sparkling.bth', package="rLakeAnalyzer")

	# Load data for example lake, Sparkilng Lake, Wisconsin.
	wtr = load.ts(wtr.path)
	bth = load.bathy(bth.path)
	
	## Not run: 
##D   # Generate default plot
##D   schmidt.plot(wtr,bth)
##D   
## End(Not run)



