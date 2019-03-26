library(automap)


### Name: automapPlot
### Title: Special plot function for automap
### Aliases: automapPlot

### ** Examples

# Ordinary kriging
data(meuse)
coordinates(meuse) =~ x+y
data(meuse.grid)
gridded(meuse.grid) =~ x+y

kriging_result = autoKrige(zinc~1, meuse, meuse.grid)

# Adding the sp.layout parameter shows the locations of the measurements
automapPlot(kriging_result$krige_output, "var1.pred", 
	sp.layout = list("sp.points", meuse))



