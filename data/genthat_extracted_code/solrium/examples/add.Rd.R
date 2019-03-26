library(solrium)


### Name: add
### Title: Add documents from R objects
### Aliases: add

### ** Examples

## Not run: 
##D (cli <- SolrClient$new())
##D 
##D # create the boooks collection
##D if (!collection_exists(cli, "books")) {
##D   collection_create(cli, name = "books", numShards = 1)
##D }
##D 
##D # Documents in a list
##D ss <- list(list(id = 1, price = 100), list(id = 2, price = 500))
##D add(ss, cli, name = "books")
##D cli$get(c(1, 2), "books")
##D 
##D # Documents in a data.frame
##D ## Simple example
##D df <- data.frame(id = c(67, 68), price = c(1000, 500000000))
##D add(df, cli, "books")
##D df <- data.frame(id = c(77, 78), price = c(1, 2.40))
##D add(df, "books")
##D 
##D ## More complex example, get file from package examples
##D # start Solr in Schemaless mode first: bin/solr start -e schemaless
##D file <- system.file("examples", "books.csv", package = "solrium")
##D x <- read.csv(file, stringsAsFactors = FALSE)
##D class(x)
##D head(x)
##D if (!collection_exists("mybooks")) {
##D   collection_create(name = "mybooks", numShards = 2)
##D }
##D add(x, "mybooks")
##D 
##D # Use modifiers
##D add(x, "mybooks", commit_within = 5000)
##D 
##D # Get back XML instead of a list
##D ss <- list(list(id = 1, price = 100), list(id = 2, price = 500))
##D # parsed XML
##D add(ss, name = "books", wt = "xml")
##D # raw XML
##D add(ss, name = "books", wt = "xml", raw = TRUE)
## End(Not run)



