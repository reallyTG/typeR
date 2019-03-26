library(patentsview)


### Name: get_fields
### Title: Get list of retrievable fields
### Aliases: get_fields

### ** Examples

# Get all assignee-level fields for the patents endpoint:
fields <- get_fields(endpoint = "patents", groups = "assignees")

#...Then pass to search_pv:
## Not run: 
##D 
##D search_pv(
##D   query = '{"_gte":{"patent_date":"2007-01-04"}}',
##D   fields = fields
##D )
## End(Not run)
# Get all patent and assignee-level fields for the patents endpoint:
fields <- get_fields(endpoint = "patents", groups = c("assignees", "patents"))

## Not run: 
##D #...Then pass to search_pv:
##D search_pv(
##D   query = '{"_gte":{"patent_date":"2007-01-04"}}',
##D   fields = fields
##D )
## End(Not run)




