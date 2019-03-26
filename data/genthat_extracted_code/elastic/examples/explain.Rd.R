library(elastic)


### Name: explain
### Title: Explain a search query.
### Aliases: explain

### ** Examples

## Not run: 
##D explain(index = "plos", type = "article", id = 14, q = "title:Germ")
##D 
##D body <- '{
##D  "query": {
##D    "term": { "title": "Germ" }
##D  }
##D }'
##D explain(index = "plos", type = "article", id = 14, body=body)
## End(Not run)



