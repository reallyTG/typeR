library(bea.R)


### Name: bea2Tab
### Title: Convert BEA API httr response or list payload to data.table
### Aliases: bea2Tab

### ** Examples

userSpecList <- list('UserID' = 'yourKey' ,
								'Method' = 'GetData',
								'datasetname' = 'NIPA',
								'Frequency' = 'A',
								'TableID' = '68',
								'Year' = 'X')
resp <- beaGet(userSpecList)
BDT <- bea2Tab(resp)



