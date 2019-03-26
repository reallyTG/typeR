library(microdemic)


### Name: ma_graph_search
### Title: Graph search API
### Aliases: ma_graph_search

### ** Examples

## Not run: 
##D # x <- '{
##D # "path": "/paper/AuthorIDs/author",
##D #  "paper": {
##D #    "type": "Paper",
##D #    "NormalizedTitle": "graph engine",
##D #    "select": [ "OriginalTitle" ]
##D #  },
##D #  "author": {
##D #    "return": { "type": "Author", "Name": "bin shao" }
##D #  }
##D # }'
##D # 
##D # res <- ma_graph_search(query = x)
##D # res$Results
##D # do.call(rbind, res$Results)
## End(Not run)



