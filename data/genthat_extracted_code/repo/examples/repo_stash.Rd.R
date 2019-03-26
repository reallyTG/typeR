library(repo)


### Name: repo_stash
### Title: Quickly store temporary data
### Aliases: repo_stash

### ** Examples

## Not run: 
##D rp_path <- file.path(tempdir(), "example_repo")
##D rp <- repo_open(rp_path, TRUE)
##D tempdata <- runif(10)
##D rp$stash(tempdata)
##D rp$info("tempdata")
##D 
##D ## wiping temporary repo
##D unlink(rp_path, TRUE)
## End(Not run)



