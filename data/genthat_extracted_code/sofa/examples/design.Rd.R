library(sofa)


### Name: design
### Title: Work with design documents
### Aliases: design design_create design_create_ design_delete design_get
###   design_head design_info

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
##D 
##D # the harder way, write your own function, but more flexible
##D design_create_(x, dbname='omdb', design='view2',
##D   fxnname = "stuffthings", fxn = "function(doc){emit(null,doc.Country)}")
##D 
##D # Delete a view
##D design_delete(x, dbname='omdb', design='view1')
##D 
##D # Get info on a design document
##D ## HEAD request, returns just response headers
##D design_head(x, dbname='omdb', design='view2')
##D design_head(x, dbname='omdb', design='view5')
##D ## GET request, returns information about the design document
##D design_info(x, dbname='omdb', design='view2')
##D design_info(x, dbname='omdb', design='view5')
##D 
##D # Get a design document (GET request)
##D design_get(x, dbname='omdb', design='view2')
##D design_get(x, dbname='omdb', design='view5')
##D 
##D # Search using a view
##D res <- design_search(x, dbname='omdb', design='view2')
##D head(
##D   do.call(
##D     "rbind.data.frame",
##D     lapply(res$rows, function(x) Filter(length, x))
##D   )
##D )
##D 
##D res <- design_search(x, dbname='omdb', design='view5')
##D head(
##D   structure(do.call(
##D     "rbind.data.frame",
##D     lapply(res$rows, function(x) x$value)
##D   ), .Names = c('Country', 'imdbRating'))
##D )
## End(Not run)



