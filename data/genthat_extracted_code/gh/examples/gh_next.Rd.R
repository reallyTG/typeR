library(gh)


### Name: gh_next
### Title: Get the next, previous, first or last page of results
### Aliases: gh_next gh_next gh_prev gh_next gh_first gh_next gh_last

### ** Examples

## Not run: 
##D x <- gh("/users")
##D sapply(x, "[[", "login")
##D x2 <- gh_next(x)
##D sapply(x2, "[[", "login")
## End(Not run)



