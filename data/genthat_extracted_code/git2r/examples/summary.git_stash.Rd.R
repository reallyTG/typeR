library(git2r)


### Name: summary.git_stash
### Title: Summary of a stash
### Aliases: summary.git_stash

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D # Configure a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D # Create a file, add and commit
##D writeLines("Hello world!", file.path(path, "test.txt"))
##D add(repo, 'test.txt')
##D commit(repo, "Commit message")
##D 
##D # Change file
##D writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "test.txt"))
##D 
##D # Create stash in repository
##D stash(repo, "Stash message")
##D 
##D # View summary of stash
##D summary(stash_list(repo)[[1]])
## End(Not run)



