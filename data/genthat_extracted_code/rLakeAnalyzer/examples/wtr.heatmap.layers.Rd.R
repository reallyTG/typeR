library(rLakeAnalyzer)


### Name: wtr.heatmap.layers
### Title: Plots water temperature heatmap with major limnetic layers
###   indicated
### Aliases: wtr.heatmap.layers
### Keywords: hplot

### ** Examples


  #Get the path for the package example file included 
  wtr.path <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")

  #Load data for example lake, Sparkilng Lake, Wisconsin.
  wtr = load.ts(wtr.path)
  
  # generate default plot
  ## Not run: 
##D   wtr.heatmap.layers(wtr)
##D   
## End(Not run)



