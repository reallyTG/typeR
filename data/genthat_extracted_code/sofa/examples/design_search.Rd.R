library(sofa)


### Name: design_search
### Title: Search design documents
### Aliases: design_search design_search_many

### ** Examples

## Not run: 
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
##D ## add the documents
##D invisible(db_bulk_create(x, "omdb", strs))
##D 
##D # Create a view, the easy way, but less flexible
##D design_create(x, dbname='omdb', design='view1', fxnname="foobar1")
##D design_create(x, dbname='omdb', design='view2', fxnname="foobar2",
##D   value="doc.Country")
##D design_create(x, dbname='omdb', design='view5', fxnname="foobar3",
##D   value="[doc.Country,doc.imdbRating]")
##D design_create_(x, dbname='omdb', design='view6', fxnname="foobar4",
##D   fxn = "function(doc){emit(doc._id,doc.Country)}")
##D 
##D # Search using a view
##D compact <- function(l) Filter(Negate(is.null), l)
##D res <- design_search(x, dbname='omdb', design='view2', view ='foobar2')
##D head(
##D   do.call(
##D     "rbind.data.frame",
##D     Filter(
##D       function(z) length(z) == 2,
##D       lapply(res$rows, function(x) compact(x[names(x) %in% c('id', 'value')]))
##D     )
##D   )
##D )
##D 
##D res <- design_search(x, dbname='omdb', design='view5', view = 'foobar3')
##D head(
##D   structure(do.call(
##D     "rbind.data.frame",
##D     lapply(res$rows, function(x) x$value)
##D   ), .Names = c('Country', 'imdbRating'))
##D )
##D 
##D # query parameters
##D ## limit
##D design_search(x, dbname='omdb', design='view5', view = 'foobar3',
##D   params = list(limit = 5))
##D ## limit and skip
##D design_search(x, dbname='omdb', design='view5', view = 'foobar3',
##D   params = list(limit = 5, skip = 3))
##D 
##D # POST request
##D ids <- vapply(db_alldocs(x, dbname='omdb')$rows[1:3], "[[", "", "id")
##D res <- design_search(x, dbname='omdb', design='view6', view = 'foobar4',
##D   body = list(keys = ids), verbose = TRUE)
##D res
##D 
##D # Many queries at once in a POST request
##D queries <- list(
##D   list(keys = ids),
##D   list(limit = 3, skip = 2)
##D )
##D design_search_many(x, 'omdb', 'view6', 'foobar4', queries)
## End(Not run)



