library(bea.R)


### Name: beaGet
### Title: Pass list of user specifications (including API key) to return
###   data from BEA API.
### Aliases: beaGet

### ** Examples

userSpecList <- list('UserID' = 'yourAPIKey' ,
								'Method' = 'GetData',
								'datasetname' = 'NIPA',
								'Frequency' = 'A',
								'TableID' = '68',
								'Year' = 'X')	
BDT <- beaGet(userSpecList, asTable = TRUE)



