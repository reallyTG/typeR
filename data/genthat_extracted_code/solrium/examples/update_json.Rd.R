library(solrium)


### Name: update_json
### Title: Update documents with JSON data
### Aliases: update_json

### ** Examples

## Not run: 
##D # start Solr: bin/solr start -f -c -p 8983
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # Add documents
##D file <- system.file("examples", "books2.json", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_json(files = file, name = "books")
##D update_json(conn, files = file, name = "books")
##D 
##D # Update commands - can include many varying commands
##D ## Add file
##D file <- system.file("examples", "updatecommands_add.json",
##D   package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_json(file, "books")
##D 
##D ## Delete file
##D file <- system.file("examples", "updatecommands_delete.json",
##D   package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_json(file, "books")
##D 
##D # Add and delete in the same document
##D ## Add a document first, that we can later delete
##D ss <- list(list(id = 456, name = "cat"))
##D conn$add(ss, "books")
## End(Not run)



