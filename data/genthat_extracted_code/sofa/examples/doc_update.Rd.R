library(sofa)


### Name: doc_update
### Title: Update a document.
### Aliases: doc_update

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("sofadb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="sofadb"))
##D }
##D db_create(x, dbname='sofadb')
##D 
##D doc1 <- '{"name":"drink","beer":"IPA"}'
##D doc_create(x, dbname="sofadb", doc=doc1, docid="b_beer")
##D doc_get(x, dbname = "sofadb", docid = "b_beer")
##D revs <- db_revisions(x, dbname = "sofadb", docid = "b_beer")
##D doc2 <- '{"name":"drink","beer":"IPA","note":"yummy","note2":"yay"}'
##D doc_update(x, dbname="sofadb", doc=doc2, docid="b_beer", rev=revs[1])
##D db_revisions(x, dbname = "sofadb", docid = "b_beer")
## End(Not run)



