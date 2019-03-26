library(sbtools)


### Name: sbitem
### Title: ScienceBase item class
### Aliases: as.sbitem as.sbitem.default is.sbitem sbitem

### ** Examples

## Not run: 
##D # Single item from item_get()
##D item_get("4f4e4b24e4b07f02db6aea14")
##D 
##D # Get many w/ e.g., an lapply() call
##D library("httr")
##D res <- query_items(list(s = "Search", q = "water", format = "json"))
##D ids <- vapply(httr::content(res)$items, "[[", "", "id")
##D (out <- lapply(ids[1:3], item_get))
##D 
##D # create item class from only an item ID
##D as.sbitem("4f4e4b24e4b07f02db6aea14")
##D 
##D # sbitem gives back itself
##D (x <- as.sbitem("4f4e4b24e4b07f02db6aea14"))
##D as.sbitem(x)
## End(Not run)



