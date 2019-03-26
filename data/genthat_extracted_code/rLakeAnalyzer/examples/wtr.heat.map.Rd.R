library(rLakeAnalyzer)


### Name: wtr.heat.map
### Title: Plots a heat-map of water temperature.
### Aliases: wtr.heat.map
### Keywords: hplot

### ** Examples


	#Get the path for the package example file included
	wtr.path <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	
	#Load data for example lake, Sparkilng Lake, Wisconsin.
	sp.wtr = load.ts(wtr.path)
	
	#Plot default figure
	wtr.heat.map(sp.wtr)

	#Change defaults supplied to filled.contour
	wtr.heat.map(sp.wtr, zlim=c(0,15), plot.title="Sparkling Water Temp (C)")



