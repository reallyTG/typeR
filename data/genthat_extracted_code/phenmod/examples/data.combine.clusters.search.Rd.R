library(phenmod)


### Name: data.combine.clusters.search
### Title: Cluster search
### Aliases: data.combine.clusters.search

### ** Examples

  ## load extracted observations as created by 'data.extract'
  data(extractedObs)

  ## create station net
  stations.net <- data.combine.stationNet(extractedObs, range=5000, 
				alt.range=50, silent=FALSE, out2File=FALSE)

  ## search clusters in station net
  stations <- as.list(unique(extractedObs$STAT_ID))
  clusters <- data.combine.clusters.search(stations, 
			stations.net, shuffle=TRUE)

  



