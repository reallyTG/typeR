library(sofa)


### Name: doc_delete
### Title: Delete a document in a database.
### Aliases: doc_delete

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
##D doc3 <- "<top><a/><b/><c><d/><e>bob</e></c></top>"
##D doc_create(x, dbname="sofadb", doc=doc3, docid="newnewxml")
##D doc_delete(x, dbname="sofadb", docid="newnewxml")
##D doc_delete(x, dbname="sofadb", docid="newnewxml")
##D 
##D # wrong docid name
##D doc_create(x, dbname="sofadb", doc=doc3, docid="newxml")
##D doc_delete(x, dbname="sofadb", docid="wrongname")
## End(Not run)



