library(elastic)


### Name: validate
### Title: Validate a search
### Aliases: validate

### ** Examples

## Not run: 
##D if (!index_exists("twitter")) index_create("twitter")
##D docs_create('twitter', type='tweet', id=1, body = list(
##D    "user" = "foobar", 
##D    "post_date" = "2014-01-03",
##D    "message" = "trying out Elasticsearch"
##D  )
##D )
##D validate("twitter", q='user:foobar')
##D validate("twitter", "tweet", q='user:foobar')
##D 
##D body <- '{
##D "query" : {
##D   "bool" : {
##D     "must" : {
##D       "query_string" : {
##D         "query" : "*:*"
##D       }
##D     },
##D     "filter" : {
##D       "term" : { "user" : "kimchy" }
##D     }
##D   }
##D }
##D }'
##D validate("twitter", body = body)
## End(Not run)



