library(sofa)


### Name: doc_get
### Title: Get a document from a database.
### Aliases: doc_get

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("sofadb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="sofadb"))
##D }
##D db_create(x, dbname="sofadb")
##D 
##D # create a document
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="sofadb", doc1, docid="abeer")
##D 
##D doc_get(x, dbname="sofadb", docid="abeer")
##D revs <- db_revisions(x, dbname="sofadb", docid="abeer")
##D doc_get(x, dbname="sofadb", docid="abeer", rev=revs[1])
##D doc_get(x, dbname="sofadb", docid="abeer", rev=revs[2])
##D doc_get(x, dbname="sofadb", docid="abeer", as='json')
##D doc_get(x, dbname="sofadb", docid="abeer", revs=TRUE)
##D doc_get(x, dbname="sofadb", docid="abeer", revs=TRUE, local_seq=TRUE)
## End(Not run)



