library(bea.R)


### Name: bea2List
### Title: Convert BEA API httr response payload to list
### Aliases: bea2List

### ** Examples

userSpecList <- list('UserID' = 'yourKey' ,
								'Method' = 'GetData',
								'datasetname' = 'NIPA',
								'Frequency' = 'A',
								'TableID' = '68',
								'Year' = 'X')
resp <- beaGet(userSpecList, asTable = FALSE)
BL <- bea2List(resp)



