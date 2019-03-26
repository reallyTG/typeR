library(git2r)


### Name: print.git_reflog_entry
### Title: Print a reflog entry
### Aliases: print.git_reflog_entry

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
##D ## View repository HEAD reflog
##D reflog(repo)
## End(Not run)



