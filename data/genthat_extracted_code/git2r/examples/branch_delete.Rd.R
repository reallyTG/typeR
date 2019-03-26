library(git2r)


### Name: branch_delete
### Title: Delete a branch
### Aliases: branch_delete

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
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## Create a 'dev' branch
##D dev <- branch_create(commit_1, name = "dev")
##D branches(repo)
##D 
##D ## Delete 'dev' branch
##D branch_delete(dev)
##D branches(repo)
## End(Not run)



