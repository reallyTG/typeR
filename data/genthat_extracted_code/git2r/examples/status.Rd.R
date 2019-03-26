library(git2r)


### Name: status
### Title: Status
### Aliases: status

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Config user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file
##D writeLines("Hello world!", file.path(path, "test.txt"))
##D 
##D ## Check status; untracked file
##D status(repo)
##D 
##D ## Add file
##D add(repo, "test.txt")
##D 
##D ## Check status; staged file
##D status(repo)
##D 
##D ## Commit
##D commit(repo, "First commit message")
##D 
##D ## Check status; clean
##D status(repo)
##D 
##D ## Change the file
##D writeLines(c("Hello again!", "Here is a second line", "And a third"),
##D            file.path(path, "test.txt"))
##D 
##D ## Check status; unstaged file
##D status(repo)
##D 
##D ## Add file and commit
##D add(repo, "test.txt")
##D commit(repo, "Second commit message")
##D 
##D ## Check status; clean
##D status(repo)
## End(Not run)



