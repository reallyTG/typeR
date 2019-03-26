library(sbtools)


### Name: item_upsert
### Title: Upsert an SB item
### Aliases: item_upsert

### ** Examples

## Not run: 
##D # helper function to make a random name
##D aname <- function() paste0(sample(letters, size = 5, replace = TRUE), collapse = "")
##D 
##D # Create an item - by default we use your user ID
##D (x <- item_upsert(title = aname()))
##D 
##D # Call item_upsert again, updates this time
##D item_upsert(x, info = list(
##D 		contacts = list(list(name = "Suzy"))
##D 	)
##D )
## End(Not run)



