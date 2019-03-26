library(phenmod)


### Name: data.combine.stationNet
### Title: Station net creator
### Aliases: data.combine.stationNet

### ** Examples

  ## load extracted observations as created by 'data.extract'
  data(extractedObs)

  ## create station net
  stations.net <- data.combine.stationNet(extractedObs, 
				range=5000, alt.range=50, silent=FALSE, 
				out2File=FALSE)



