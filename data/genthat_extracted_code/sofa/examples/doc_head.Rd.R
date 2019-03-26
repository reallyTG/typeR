library(sofa)


### Name: doc_head
### Title: Get header info for a document
### Aliases: doc_head

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D # create a database
##D if ("sofadb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="sofadb"))
##D }
##D db_create(x, dbname='sofadb')
##D 
##D # create a document
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="sofadb", doc1, docid="abeer")
##D 
##D # run doc_head
##D doc_head(x, dbname="sofadb", docid="abeer")
##D doc_head(x, dbname="sofadb", docid="abeer", as='json')
## End(Not run)



