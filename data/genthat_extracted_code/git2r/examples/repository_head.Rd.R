library(git2r)


### Name: repository_head
### Title: Get HEAD for a repository
### Aliases: repository_head

### ** Examples

## Not run: 
##D ## Create and initialize a repository in a temporary directory
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Commit message")
##D 
##D ## Get HEAD of repository
##D repository_head(repo)
## End(Not run)



