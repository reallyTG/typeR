library(sofa)


### Name: db_query
### Title: Query a database.
### Aliases: db_query

### ** Examples

## Not run: 
##D ## create a connection
##D (x <- Cushion$new())
##D 
##D file <- system.file("examples/omdb.json", package = "sofa")
##D strs <- readLines(file)
##D 
##D ## create a database
##D if ("omdb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="omdb"))
##D }
##D db_create(x, dbname='omdb')
##D 
##D ## add some documents
##D invisible(db_bulk_create(x, "omdb", strs))
##D 
##D ## query all in one json blob
##D db_query(x, dbname = "omdb", query = '{
##D   "selector": {
##D     "_id": {
##D       "$gt": null
##D     }
##D   }
##D }')
##D 
##D ## query with each parameter
##D db_query(x, dbname = "omdb",
##D   selector = list(`_id` = list(`$gt` = NULL)))
##D 
##D db_query(x, dbname = "omdb",
##D   selector = list(`_id` = list(`$gt` = NULL)), limit = 3)
##D 
##D # fields
##D ## single field works
##D db_query(x, dbname = "omdb",
##D   selector = list(`_id` = list(`$gt` = NULL)), limit = 3,
##D   fields = c('_id', 'Actors', 'imdbRating'))
##D 
##D ## as well as many fields
##D db_query(x, dbname = "omdb",
##D   selector = list(`_id` = list(`$gt` = NULL)), limit = 3,
##D   fields = '_id')
##D 
##D ## other queries
##D db_query(x, dbname = "omdb",
##D   selector = list(Year = list(`$gt` = "2013")))
##D 
##D db_query(x, dbname = "omdb", selector = list(Rated = "R"))
##D 
##D db_query(x, dbname = "omdb",
##D   selector = list(Rated = "PG", Language = "English"))
##D 
##D db_query(x, dbname = "omdb", selector = list(
##D   `$or` = list(
##D     list(Director = "Jon Favreau"),
##D     list(Director = "Spike Lee")
##D   )
##D ), fields = c("_id", "Director"))
##D 
##D ## when selector vars are of same name, use a JSON string
##D ## b/c R doesn't let you have a list with same name slots
##D db_query(x, dbname = "omdb", query = '{
##D   "selector": {
##D     "Year": {"$gte": "1990"},
##D     "Year": {"$lte": "2000"},
##D     "$not": {"Year": "1998"}
##D   },
##D   "fields": ["_id", "Year"]
##D }')
##D 
##D ## regex
##D db_query(x, dbname = "omdb", selector = list(
##D   Director = list(`$regex` = "^R")
##D ), fields = c("_id", "Director"))
##D 
## End(Not run)



