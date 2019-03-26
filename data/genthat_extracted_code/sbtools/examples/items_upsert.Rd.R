library(sbtools)


### Name: items_upsert
### Title: Upsert many SB items
### Aliases: items_upsert

### ** Examples

## Not run: 
##D # helper function to make a random name
##D aname <- function() paste0(sample(letters, size = 5, replace = TRUE), collapse = "")
##D 
##D # Create some item - by default we use your user ID
##D z1 <- item_create(title = aname())
##D z2 <- item_create(title = aname())
##D 
##D # Upsert items
##D (x <- items_upsert(list(z1, z2), title = c(aname(), aname())))
##D 
##D # Call item_upsert again, updates this time
##D items_upsert(x, info = list(
##D 		contacts = list(list(name = "Suzy"))
##D 	)
##D )
## End(Not run)



