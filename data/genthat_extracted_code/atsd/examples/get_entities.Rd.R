library(atsd)


### Name: get_entities
### Title: Get information about entities from Axibase Time-Series
###   Database.
### Aliases: get_entities

### ** Examples

## Not run: 
##D # get all entities and include all their tags in the data frame
##D get_entities()
##D 
##D # get all active entities and include all their tags in the data frame
##D get_entities(active = "true")
##D 
##D # Get the top 2 entities whose 'name'  and user-defined entity tag, 'app',
##D # match to the expression. Include the tag, 'app', into response 
##D # and exclude oter user-defined entity tags.
##D get_entities(expression = "name like 'nur*' and lower(tags.app) like '*hbase*'", 
##D              tags = "app", limit = 2)
## End(Not run)



