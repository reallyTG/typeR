library(git2r)


### Name: is_empty
### Title: Check if repository is empty
### Aliases: is_empty

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
##D ## Check if it's an empty repository
##D is_empty(repo)
##D 
##D ## Commit a file
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Check if it's an empty repository
##D is_empty(repo)
## End(Not run)



