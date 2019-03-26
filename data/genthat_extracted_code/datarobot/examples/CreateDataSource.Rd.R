library(datarobot)


### Name: CreateDataSource
### Title: Create a data source.
### Aliases: CreateDataSource

### ** Examples

## Not run: 
##D  dataStoreId <- "5c1303269300d900016b41a7"
##D  CreateDataSource(type = "jdbc",
##D                   canonicalName = "Airline stats after 1995",
##D                   dataStoreId = dataStoreId,
##D                   query = 'SELECT * FROM airlines10mb WHERE "Year" >= 1995;')
## End(Not run)



