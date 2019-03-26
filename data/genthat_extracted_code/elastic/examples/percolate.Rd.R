library(elastic)


### Name: percolate
### Title: Percolater
### Aliases: percolate percolate_register percolate_match percolate_list
###   percolate_count percolate_delete

### ** Examples

## Not run: 
##D ##### Elasticsearch < v5
##D # typical usage
##D ## create an index first
##D if (index_exists("myindex")) index_delete("myindex")
##D mapping <- '{
##D   "mappings": {
##D     "mytype": {
##D       "properties": {
##D         "message": {
##D            "type": "text"
##D         },
##D         "name": {
##D            "type": "text"
##D         }
##D       }
##D     }
##D   }
##D }'
##D index_create("myindex", body = mapping)
##D 
##D ## register a percolator
##D perc_body = '{
##D  "query" : {
##D     "match" : {
##D       "message" : "bonsai tree"
##D     }
##D  }
##D }'
##D percolate_register(index = "myindex", id = 1, body = perc_body)
##D 
##D ## register another
##D perc_body2 <- '{
##D   "query" : {
##D     "match" : {
##D       "name" : "jane doe"
##D     }
##D   }
##D }'
##D percolate_register(index = "myindex", id = 2, body = perc_body2)
##D 
##D ## match a document to a percolator
##D doc <- '{
##D   "doc" : {
##D     "message" : "A new bonsai tree in the office"
##D   }
##D }'
##D percolate_match(index = "myindex", type = "mytype", body = doc, config = verbose())
##D 
##D ## List percolators - for an index, no type, can't do across indices
##D percolate_list(index = "myindex")$hits$hits
##D 
##D ## Percolate counter
##D percolate_count(index = "myindex", type = "mytype", body = doc)$total
##D 
##D ## delete a percolator
##D percolate_delete(index = "myindex", id = 2)
##D 
##D # multi percolate
##D ## not working yet
##D 
##D 
##D 
##D ##### Elasticsearch >= v5
##D if (index_exists("myindex")) index_delete("myindex")
##D body <- '{
##D   "mappings": {
##D     "doctype": {
##D       "properties": {
##D         "message": {
##D           "type": "text"
##D         }
##D       }
##D     },
##D     "queries": {
##D       "properties": {
##D         "query": {
##D           "type": "percolator"
##D         }
##D       }
##D     }
##D   }
##D }'
##D 
##D # create the index with mapping
##D index_create("myindex", body = body)
##D 
##D ## register a percolator
##D x <- '{
##D   "query" : {
##D      "match" : {
##D        "message" : "bonsai tree"
##D      }
##D   }
##D }'
##D percolate_register(index = "myindex", type = "queries", id = 1, body = x)
##D 
##D ## register another
##D x2 <- '{
##D   "query" : {
##D     "match" : {
##D       "message" : "the office"
##D     }
##D   }
##D }'
##D percolate_register(index = "myindex", type = "queries", id = 2, body = x2)
##D 
##D ## match a document to a percolator
##D query <- '{
##D   "query" : {
##D     "percolate" : {
##D       "field": "query",
##D       "document_type": "doctype",
##D       "document": {
##D         "message": "A new bonsai tree in the office"
##D       }
##D     }
##D   }
##D }'
##D percolate_match(index = "myindex", body = query)
## End(Not run)



