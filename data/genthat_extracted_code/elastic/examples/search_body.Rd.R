library(elastic)


### Name: search_body
### Title: Full text search of Elasticsearch - body requests.
### Aliases: search_body
### Keywords: internal

### ** Examples

## Not run: 
##D # pass in as an R list
##D # aggs <- list(aggs = list(stats = list(terms = list(field = "text_entry"))))
##D # search_body(index="shakespeare", query=aggs)
##D 
##D # or pass in as json query with newlines, easy to read
##D aggs <- '{
##D     "aggs": {
##D         "stats" : {
##D             "terms" : {
##D                 "field" : "text_entry"
##D             }
##D         }
##D     }
##D }'
##D # search_body(index="shakespeare", query=aggs)
##D 
##D 
##D # or pass in collapsed json string
##D aggs <- '{"aggs":{"stats":{"terms":{"field":"text_entry"}}}}'
##D # search_body(index="shakespeare", query=aggs)
##D 
##D # match query
##D match <- '{"query": {"match" : {"text_entry" : "Two Gentlemen"}}}'
##D # search_body(index="shakespeare", query=match)
##D 
##D # multi-match (multiple fields that is) query
##D mmatch <- '{"query": {"multi_match" : {"query" : "henry", "fields": 
##D ["text_entry","play_name"]}}}'
##D # search_body(index="shakespeare", query=mmatch)
##D 
##D # bool query
##D mmatch <- '{
##D  "query": {
##D    "bool" : {
##D      "must_not" : {
##D        "range" : {
##D          "speech_number" : {
##D            "from" : 1, "to": 5
##D }}}}}}'
##D # search_body(index="shakespeare", query=mmatch)
##D 
##D # Boosting query
##D boost <- '{
##D  "query" : {
##D   "boosting" : {
##D       "positive" : {
##D           "term" : {
##D               "play_name" : "henry"
##D           }
##D       },
##D       "negative" : {
##D           "term" : {
##D               "text_entry" : "thou"
##D           }
##D       },
##D       "negative_boost" : 0.2
##D     }
##D  }
##D }'
##D # search_body(index="shakespeare", query=mmatch)
## End(Not run)



