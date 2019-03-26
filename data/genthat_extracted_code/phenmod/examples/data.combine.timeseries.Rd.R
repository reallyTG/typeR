library(phenmod)


### Name: data.combine.timeseries
### Title: Create combined timeseries
### Aliases: data.combine.timeseries

### ** Examples

  ## load extracted observations as created by 'data.extract'
  data(extractedObs)

  ## create station net
  stations.net <- data.combine.stationNet(extractedObs, 
				range=5000, alt.range=50, silent=FALSE, 
				out2File=FALSE)

  ## search clusters in station net
  clusters <- data.combine.clusters(extractedObs, 
			stations.net, shuffle=TRUE, tries=3, 
			silent=FALSE, out2File=FALSE)

  ## combine timeseries
  data.combined <- data.combine.timeseries(extractedObs, 
				clusters, out2File=FALSE)



