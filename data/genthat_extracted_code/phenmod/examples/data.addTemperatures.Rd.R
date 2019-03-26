library(phenmod)


### Name: data.addTemperatures
### Title: Add temperature data to a dataset.
### Aliases: data.addTemperatures

### ** Examples

  ## load extracted observations as created by 'data.extract'
  data(extractedObs)
  ## load temperature data
  data(temperatures)
  ## load grid with spatial informations for temperature files
  data(relatedGrid)	

  ## add temperatures from files in working directory
  dataset <- data.addTemperatures(dataset=extractedObs, 
				out2File=FALSE,
				grid.related.to.Temperatures=relatedGrid,
				temperature.filenames=NULL, 
				temperature.matrix=temperatures,
				temperature.scale.factor=0.1)
 
  ## resulting dataset should equal 'dataFinal'
  data(dataFinal)
  dataFinal
  dataset



