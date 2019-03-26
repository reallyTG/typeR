library(dwapi)


### Name: sql
### Title: Execute SQL query against a dataset.
### Aliases: sql

### ** Examples

## Not run: 
##D   dwapi::sql(dataset="user/dataset",
##D     query="SELECT *
##D            FROM TableName
##D            LIMIT 10")
##D 
##D   dwapi::sql(dataset="user/dataset",
##D     query="SELECT *
##D            FROM TableName where `field1` = ? AND `field2` > ?
##D            LIMIT 10",
##D     queryParameters = list("value", 5.0))
## End(Not run)



