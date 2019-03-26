library(sbtools)


### Name: items_update
### Title: Update many SB items with new metadata
### Aliases: items_update

### ** Examples

## Not run: 
##D # helper function to make a random name
##D aname <- function() paste0(sample(letters, size = 5, replace = TRUE), collapse = "")
##D 
##D res <- items_create(user_id(), title = c(aname(), aname())) 
##D out <- items_update(res, info = list( list(title = aname()), list(title = aname()) ) )
##D vapply(out, "[[", "", "title")
## End(Not run)



