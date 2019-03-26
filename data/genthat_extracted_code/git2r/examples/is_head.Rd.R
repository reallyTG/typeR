library(git2r)


### Name: is_head
### Title: Check if branch is head
### Aliases: is_head

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## List branches
##D branches(repo)
##D 
##D ## Check that 'master' is_head
##D master <- branches(repo)[[1]]
##D is_head(master)
##D 
##D ## Create and checkout 'dev' branch
##D checkout(repo, "dev", create = TRUE)
##D 
##D ## List branches
##D branches(repo)
##D 
##D ## Check that 'master' is no longer head
##D is_head(master)
## End(Not run)



