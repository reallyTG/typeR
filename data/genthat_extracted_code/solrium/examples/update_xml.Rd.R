library(solrium)


### Name: update_xml
### Title: Update documents with XML data
### Aliases: update_xml

### ** Examples

## Not run: 
##D # start Solr: bin/solr start -f -c -p 8983
##D 
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # create a collection
##D if (!conn$collection_exists("books")) {
##D   conn$collection_create(name = "books", numShards = 2)
##D }
##D 
##D # Add documents
##D file <- system.file("examples", "books.xml", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_xml(file, "books")
##D 
##D # Update commands - can include many varying commands
##D ## Add files
##D file <- system.file("examples", "books2_delete.xml", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_xml(file, "books")
##D 
##D ## Delete files
##D file <- system.file("examples", "updatecommands_delete.xml",
##D package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_xml(file, "books")
##D 
##D ## Add and delete in the same document
##D ## Add a document first, that we can later delete
##D ss <- list(list(id = 456, name = "cat"))
##D conn$add(ss, "books")
##D ## Now add a new document, and delete the one we just made
##D file <- system.file("examples", "add_delete.xml", package = "solrium")
##D cat(readLines(file), sep = "\n")
##D conn$update_xml(file, "books")
## End(Not run)



