library(phenmod)


### Name: data.combine
### Title: Main function to combine timeseries
### Aliases: data.combine

### ** Examples

  ## load extracted observations as created by 'data.extract'
  data(extractedObs)
  
  ## combine timeseries
  data.combined <- data.combine(dataset=extractedObs, range=5000, 
				alt.range=50, shuffle=TRUE, tries=3, 
				silent=FALSE, out2File=FALSE, 
				clusters.tmp.file=NULL)



