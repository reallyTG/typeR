library(elasticsearchr)


### Name: valid_json
### Title: Valid JSON string predicate function
### Aliases: valid_json

### ** Examples

## Not run: 
##D good_json <- '{"id": 1}'
##D valid_json(good_json)
##D # TRUE
##D 
##D bad_json <- '{"id": 1a}'
##D valid_json(bad_json)
##D # FALSE
## End(Not run)



