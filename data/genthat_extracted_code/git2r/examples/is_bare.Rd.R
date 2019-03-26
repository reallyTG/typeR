library(git2r)


### Name: is_bare
### Title: Check if repository is bare
### Aliases: is_bare

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D is_bare(repo)
##D 
##D ## Initialize a bare repository
##D path_bare <- tempfile(pattern="git2r-")
##D dir.create(path_bare)
##D repo_bare <- init(path_bare, bare = TRUE)
##D is_bare(repo_bare)
## End(Not run)



