library(crunch)


### Name: catalog-dataframes
### Title: as.data.frame method for catalog objects
### Aliases: catalog-dataframes as.data.frame.VariableCatalog
###   as.data.frame.ShojiCatalog as.data.frame.BatchCatalog
###   as.data.frame.FilterCatalog as.data.frame.UserCatalog

### ** Examples

## Not run: 
##D ds <- loadDataset("iris")
##D vars <- variables(ds)
##D var_df <- as.data.frame(vars, keys = TRUE)
##D # With row names
##D as.data.frame(vars, row.names = urls(vars))
## End(Not run)




