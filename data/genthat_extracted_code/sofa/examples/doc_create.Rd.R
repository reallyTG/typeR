library(sofa)


### Name: doc_create
### Title: Create documents to a database.
### Aliases: doc_create

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D if ("sofadb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="sofadb"))
##D }
##D db_create(x, 'sofadb')
##D 
##D # write a document WITH a name (uses PUT)
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="sofadb", doc1, docid="abeer")
##D doc_create(x, dbname="sofadb", doc1, docid="morebeer", as='json')
##D doc_get(x, dbname = "sofadb", docid = "abeer")
##D ## with factor class values
##D doc2 <- list(name = as.factor("drink"), beer = "stout", score = 4)
##D doc_create(x, doc2, dbname="sofadb", docid="nextbeer", as='json')
##D doc_get(x, dbname = "sofadb", docid = "nextbeer")
##D 
##D # write a json document WITHOUT a name (uses POST)
##D doc2 <- '{"name": "food", "icecream": "rocky road"}'
##D doc_create(x, doc2, dbname="sofadb")
##D doc3 <- '{"planet": "mars", "size": "smallish"}'
##D doc_create(x, doc3, dbname="sofadb")
##D ## assigns a UUID instead of a user given name
##D db_alldocs(x, dbname = "sofadb")
##D 
##D # write an xml document WITH a name (uses PUT). xml is written as xml in
##D # couchdb, just wrapped in json, when you get it out it will be as xml
##D doc4 <- "<top><a/><b/><c><d/><e>bob</e></c></top>"
##D doc_create(x, doc4, dbname="sofadb", docid="somexml")
##D doc_get(x, dbname = "sofadb", docid = "somexml")
##D 
##D # You can pass in lists that autoconvert to json internally
##D doc1 <- list(name = "drink", beer = "IPA", score = 9)
##D doc_create(x, dbname="sofadb", doc1, docid="goodbeer")
##D 
##D # Write directly from a data.frame
##D ## Each row or column becomes a separate document
##D ### by rows
##D db_create(x, dbname = "test")
##D doc_create(x, mtcars, dbname="test", how="rows")
##D doc_create(x, mtcars, dbname="test", how="columns")
##D 
##D head(iris)
##D db_create(x, dbname = "testiris")
##D doc_create(x, iris, dbname = "testiris")
## End(Not run)



