library(sbtools)


### Name: item_get
### Title: Retrieve SB item
### Aliases: item_get

### ** Examples

# Get an item
item_get("4f4e4b24e4b07f02db6aea14")

## Not run: 
##D # Search for item IDs, then pass to item_get
##D library("httr")
##D res <- query_items(list(s = "Search", q = "water", format = "json"))
##D ids <- vapply(httr::content(res)$items, "[[", "", "id")
##D lapply(ids[1:3], item_get)
## End(Not run)



