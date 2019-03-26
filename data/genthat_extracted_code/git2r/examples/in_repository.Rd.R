library(git2r)


### Name: in_repository
### Title: Determine if a directory is in a git repository
### Aliases: in_repository

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Check if path is in a git repository
##D in_repository(path)
##D 
##D ## Check if working directory is in a git repository
##D setwd(path)
##D in_repository()
## End(Not run)



