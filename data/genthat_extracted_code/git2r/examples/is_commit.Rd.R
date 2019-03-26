library(git2r)


### Name: is_commit
### Title: Check if object is a git_commit object
### Aliases: is_commit

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
##D ## Commit a text file
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## Check if commit
##D is_commit(commit_1)
## End(Not run)



