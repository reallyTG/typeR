library(git2r)


### Name: stash_pop
### Title: Pop stash
### Aliases: stash_pop

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
##D stash(repo)
##D 
##D # Change file
##D writeLines(c("Hello world!", "HeLlO wOrLd!"), file.path(path, "test.txt"))
##D 
##D # Create stash in repository
##D stash(repo)
##D 
##D # View stashes
##D stash_list(repo)
##D 
##D # Read file
##D readLines(file.path(path, "test.txt"))
##D 
##D # Pop latest git_stash object in repository
##D stash_pop(stash_list(repo)[[1]])
##D 
##D # Read file
##D readLines(file.path(path, "test.txt"))
##D 
##D # View stashes
##D stash_list(repo)
## End(Not run)



