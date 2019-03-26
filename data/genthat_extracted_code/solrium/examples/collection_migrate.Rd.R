library(solrium)


### Name: collection_migrate
### Title: Migrate documents to another collection
### Aliases: collection_migrate

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # create collection
##D if (!conn$collection_exists("migrate_from")) {
##D   conn$collection_create(name = "migrate_from")
##D   # OR: bin/solr create -c migrate_from
##D }
##D 
##D # create another collection
##D if (!conn$collection_exists("migrate_to")) {
##D   conn$collection_create(name = "migrate_to")
##D   # OR bin/solr create -c migrate_to
##D }
##D 
##D # add some documents
##D file <- system.file("examples", "books.csv", package = "solrium")
##D x <- read.csv(file, stringsAsFactors = FALSE)
##D conn$add(x, "migrate_from")
##D 
##D # migrate some documents from one collection to the other
##D ## FIXME - not sure if this is actually working....
##D # conn$collection_migrate("migrate_from", "migrate_to", split.key = "05535")
## End(Not run)



