library(git2r)


### Name: stash_list
### Title: List stashes in repository
### Aliases: stash_list

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
##D writeLines("Hello world!", file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D commit(repo, "Commit message")
##D 
##D # Make one more commit
##D writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D commit(repo, "Next commit message")
##D 
##D # Create one more file
##D writeLines("Hello world!", file.path(path, "test-2.txt"))
##D 
##D # Check that there are no stashes
##D stash_list(repo)
##D 
##D # Stash
##D stash(repo)
##D 
##D # Only untracked changes, therefore no stashes
##D stash_list(repo)
##D 
##D # Stash and include untracked changes
##D stash(repo, "Stash message", untracked=TRUE)
##D 
##D # View stash
##D stash_list(repo)
## End(Not run)



