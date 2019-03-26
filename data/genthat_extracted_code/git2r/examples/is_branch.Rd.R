library(git2r)


### Name: is_branch
### Title: Check if object is 'git_branch'
### Aliases: is_branch

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
##D commit(repo, "First commit message")
##D 
##D branch <- branches(repo)[[1]]
##D 
##D ## Check if branch
##D is_branch(branch)
## End(Not run)



