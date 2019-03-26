library(sofa)


### Name: db_alldocs
### Title: List all docs in a given database.
### Aliases: db_alldocs

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D db_create(x, dbname='leothelion')
##D bulk_create(x, mtcars, dbname="leothelion")
##D 
##D db_alldocs(x, dbname="leothelion")
##D db_alldocs(x, dbname="leothelion", as='json')
##D db_alldocs(x, dbname="leothelion", limit=2)
##D db_alldocs(x, dbname="leothelion", limit=2, include_docs=TRUE)
##D 
##D # curl options
##D res <- db_alldocs(x, dbname="leothelion", verbose = TRUE)
##D 
##D # write data to disk - useful when data is very large
##D ## create omdb dataset first
##D file <- system.file("examples/omdb.json", package = "sofa")
##D strs <- readLines(file)
##D if ("omdb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="omdb"))
##D }
##D db_create(x, dbname='omdb')
##D invisible(db_bulk_create(x, "omdb", strs))
##D 
##D ## get all docs, writing them to disk
##D res <- db_alldocs(x, dbname="omdb", disk = (f <- tempfile(fileext=".json")))
##D res
##D readLines(res, n = 10)
## End(Not run)



