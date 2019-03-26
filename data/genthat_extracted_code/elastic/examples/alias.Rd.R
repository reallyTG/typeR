library(elastic)


### Name: alias
### Title: Elasticsearch alias APIs
### Aliases: alias alias_get aliases_get alias_exists alias_create
###   alias_delete

### ** Examples

## Not run: 
##D # Create/update an alias
##D alias_create(index = "plos", alias = "tables")
##D 
##D # Retrieve a specified alias
##D alias_get(index="plos")
##D alias_get(alias="tables")
##D aliases_get()
##D 
##D # Check for alias existence
##D alias_exists(index = "plos")
##D alias_exists(alias = "tables")
##D alias_exists(alias = "adsfasdf")
##D 
##D # Delete an alias
##D alias_delete(index = "plos", alias = "tables")
##D alias_exists(alias = "tables")
##D 
##D # Curl options
##D library("httr")
##D alias_create(index = "plos", alias = "tables")
##D aliases_get(alias = "tables", config=verbose())
## End(Not run)



