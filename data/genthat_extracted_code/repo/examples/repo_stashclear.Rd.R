library(repo)


### Name: repo_stashclear
### Title: Remove all stashed data
### Aliases: repo_stashclear

### ** Examples

## Not run: 
##D rp_path <- file.path(tempdir(), "example_repo")
##D rp <- repo_open(rp_path, TRUE)
##D tempdata <- runif(10)
##D rp$stash("tempdata")
##D rp$print(all=TRUE)
##D rp$stashclear(TRUE)
##D 
##D ## wiping temporary repo
##D unlink(rp_path, TRUE)
## End(Not run)



