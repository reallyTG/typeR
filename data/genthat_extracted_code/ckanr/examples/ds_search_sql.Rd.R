library(ckanr)


### Name: ds_search_sql
### Title: Datastore - search or get a dataset from CKRAN datastore
### Aliases: ds_search_sql

### ** Examples

## Not run: 
##D url <- 'http://demo.ckan.org/'
##D sql <- 'SELECT * from "f4129802-22aa-4437-b9f9-8a8f3b7b2a53" LIMIT 2'
##D ds_search_sql(sql, url = url, as = "table")
##D sql2 <- 'SELECT "Species","Genus","Family" from "f4129802-22aa-4437-b9f9-8a8f3b7b2a53" LIMIT 2'
##D ds_search_sql(sql2, url = url, as = "table")
## End(Not run)



