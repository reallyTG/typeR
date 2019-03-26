library(git2r)


### Name: plot.git_repository
### Title: Plot commits over time
### Aliases: plot.git_repository

### ** Examples

## Not run: 
##D ## Initialize repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- clone("https://github.com/ropensci/git2r.git", path)
##D 
##D ## Plot commits
##D plot(repo)
## End(Not run)



