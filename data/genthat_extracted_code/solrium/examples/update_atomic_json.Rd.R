library(solrium)


### Name: update_atomic_json
### Title: Atomic updates with JSON data
### Aliases: update_atomic_json

### ** Examples

## Not run: 
##D # start Solr in Cloud mode: bin/solr start -e cloud -noprompt
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # create a collection
##D if (!conn$collection_exists("books")) {
##D   conn$collection_delete("books")
##D   conn$collection_create("books")
##D }
##D 
##D # Add documents
##D file <- system.file("examples", "books2.json", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_json(file, "books")
##D 
##D # get a document
##D conn$get(ids = 343334534545, "books")
##D 
##D # atomic update
##D body <- '[{
##D  "id": "343334534545",
##D  "genre_s": {"set": "mystery" },
##D  "pages_i": {"inc": 1 }
##D }]'
##D conn$update_atomic_json(body, "books")
##D 
##D # get the document again
##D conn$get(ids = 343334534545, "books")
##D 
##D # another atomic update
##D body <- '[{
##D  "id": "343334534545",
##D  "price": {"remove": "12.5" }
##D }]'
##D conn$update_atomic_json(body, "books")
##D 
##D # get the document again
##D conn$get(ids = 343334534545, "books")
## End(Not run)



