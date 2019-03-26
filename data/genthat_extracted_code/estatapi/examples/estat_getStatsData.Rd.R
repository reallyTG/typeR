library(estatapi)


### Name: estat_getStatsData
### Title: getStatsData API
### Aliases: estat_getStatsData

### ** Examples

## Not run: 
##D # fetch all data, which may take time
##D estat_getStatsData(
##D   appId = "XXXX",
##D   statsDataId = "0003065345"
##D )
##D 
##D # fetch data up to 10 records
##D estat_getStatsData(
##D   appId = "XXXX",
##D   statsDataId = "0003065345",
##D   limit = 10
##D )
##D 
##D # fetch data up to 100,000 records (max number of records available at once)
##D estat_getStatsData(
##D   appId = "XXXX",
##D   statsDataId = "0003065345",
##D   .fetch_all = FALSE
##D )
##D 
##D # fetch all data in the specifed category
##D estat_getStatsData(
##D   appId = "XXXX",
##D   statsDataId = "0003065345",
##D   cdCat01 = c("008", "009", "010")
##D )
##D 
## End(Not run)




