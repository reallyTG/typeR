library(elastic)


### Name: reindex
### Title: Reindex
### Aliases: reindex

### ** Examples

## Not run: 
##D if (!index_exists("twitter")) index_create("twitter")
##D if (!index_exists("new_twitter")) index_create("new_twitter")
##D body <- '{
##D   "source": {
##D     "index": "twitter"
##D   },
##D   "dest": {
##D     "index": "new_twitter"
##D   }
##D }'
##D reindex(body = body)
## End(Not run)



