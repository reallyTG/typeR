library(bea.R)


### Name: beaViz
### Title: Visualize BEA API response payload
### Aliases: beaViz

### ** Examples

userSpecList <- list('UserID' = 'yourKey' ,
								'Method' = 'GetData',
								'datasetname' = 'NIPA',
								'Frequency' = 'A',
								'TableID' = '68',
								'Year' = 'X')		
resp <- beaGet(userSpecList)
BDF <- beaViz(resp)
userSpecList <- list('UserID' = 'yourKey' ,
								'Method' = 'GetData',
								'datasetname' = 'NIPA',
								'Frequency' = 'A',
								'TableID' = '68',
								'Year' = 'X')



