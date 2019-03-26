library(sofa)


### Name: db_changes
### Title: List changes to a database.
### Aliases: db_changes

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("leothelion" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="leothelion"))
##D }
##D db_create(x, dbname='leothelion')
##D 
##D # no changes
##D res <- db_changes(x, dbname="leothelion")
##D res$results
##D 
##D # create a document
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="leothelion", doc1, docid="abeer")
##D 
##D # now there's changes
##D res <- db_changes(x, dbname="leothelion")
##D res$results
##D 
##D # as JSON
##D db_changes(x, dbname="leothelion", as='json')
## End(Not run)



