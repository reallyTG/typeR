library(sofa)


### Name: db_revisions
### Title: Get document revisions.
### Aliases: db_revisions

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("sofa" %in% db_list(x)) {
##D  db_delete(x, dbname = "sofadb")
##D }
##D db_create(x, dbname = "sofadb")
##D 
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="sofadb", doc1, docid="abeer")
##D doc_create(x, dbname="sofadb", doc1, docid="morebeer", as='json')
##D 
##D db_revisions(x, dbname="sofadb", docid="abeer")
##D db_revisions(x, dbname="sofadb", docid="abeer", simplify=FALSE)
##D db_revisions(x, dbname="sofadb", docid="abeer", as='json')
##D db_revisions(x, dbname="sofadb", docid="abeer", simplify=FALSE, as='json')
## End(Not run)



