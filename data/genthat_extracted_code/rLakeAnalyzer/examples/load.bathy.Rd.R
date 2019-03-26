library(rLakeAnalyzer)


### Name: load.bathy
### Title: Import lake bathymetry data.
### Aliases: load.bathy
### Keywords: file

### ** Examples


  #Get the path for the package example file included
  exampleFilePath <- system.file('extdata', 'Sparkling.bth', package="rLakeAnalyzer")
  
  #Load and plot the hypsometric curve
  sparkling.bathy = load.bathy(exampleFilePath)
  
  #If successful, there will be two colums. "depths", and "areas".
  plot(sparkling.bathy$areas, sparkling.bathy$depths, type='l', ylim=c(20,0), 
    ylab='Depths (m)', xlab='Areas (m^2)')
  



