library(phenmod)


### Name: data.main
### Title: Main function for data conversion.
### Aliases: data.main

### ** Examples

  ## load temperature data
  data(temperatures)
  ## load grid with spatial informations for temperature files
  data(relatedGrid)
  
  ## extract dataset from datafiles in working directory
  ## Not run: 
##D dataset <- data.main(extraction.done=FALSE, out2File=FALSE, 
##D 			grid.related.to.temperaturefiles=relatedGrid,
##D 			combine.timeseries=TRUE, range=5000, alt.range=50, 
##D 			temperature.scale.factor=0.1, dataPath=getwd(), 
##D 			temperature.filenames=NULL,
##D 			temperature.matrix=temperatures,
##D 			pathForTmpFiles=getwd(), pathToSave=getwd(),
##D 			plant="beech")
## End(Not run)



