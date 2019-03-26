library(rcoreoa)


### Name: core_repos
### Title: Get repositories via their repository IDs
### Aliases: core_repos

### ** Examples

## Not run: 
##D core_repos(id = 507)
##D core_repos(id = 444)
##D 
##D ids <- c(507, 444, 70)
##D res <- lapply(ids, core_repos)
##D vapply(res, "[[", "", c("data", "name"))
##D 
##D # just http request, get json as character vector back
##D core_repos_(507)
## End(Not run)



