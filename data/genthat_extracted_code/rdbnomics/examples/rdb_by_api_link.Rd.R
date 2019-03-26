library(rdbnomics)


### Name: rdb_by_api_link
### Title: Download DBnomics data using API link.
### Aliases: rdb_by_api_link

### ** Examples

## Not run: 
##D # Fetch two series from different datasets of different providers:
##D df1 <- rdb_by_api_link(
##D   paste0(
##D     'https://api.db.nomics.world/v22/',
##D     'series?observations=1&series_ids=AMECO/ZUTN/EA19.1.0.0.0.ZUTN,IMF/CPI/A.AT.PCPIT_IX'
##D   )
##D )
##D 
##D # Fetch one series from the dataset 'Doing Business' of WB provider:
##D df2 <- rdb_by_api_link(
##D   paste0(
##D     'https://api.db.nomics.world/v22/series/WB/DB?dimensions=%7B%22',
##D     'indicator%22%3A%5B%22IC.REG.PROC.FE.NO%22%5D%7D&q=Doing%20Business',
##D     '&observations=1&format=json&align_periods=1&offset=0&facets=0'
##D   )
##D )
##D 
##D # Use readLines before fromJSON to avoid a proxy failure
##D # Fetch one series from dataset 'Unemployment rate' (ZUTN) of AMECO provider:
##D options(rdbnomics.use_readLines = TRUE)
##D df2 <- rdb_by_api_link(
##D   paste0(
##D     'https://api.db.nomics.world/v22/series/WB/DB?dimensions=%7B%22',
##D     'indicator%22%3A%5B%22IC.REG.PROC.FE.NO%22%5D%7D&q=Doing%20Business',
##D     '&observations=1&format=json&align_periods=1&offset=0&facets=0'
##D   )
##D )
##D # or
##D df2 <- rdb_by_api_link(
##D   paste0(
##D     'https://api.db.nomics.world/v22/series/WB/DB?dimensions=%7B%22',
##D     'indicator%22%3A%5B%22IC.REG.PROC.FE.NO%22%5D%7D&q=Doing%20Business',
##D     '&observations=1&format=json&align_periods=1&offset=0&facets=0'
##D   ),
##D   use_readLines = TRUE
##D )
## End(Not run)



