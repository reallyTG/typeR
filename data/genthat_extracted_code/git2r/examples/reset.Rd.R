library(git2r)


### Name: reset
### Title: Reset current HEAD to the specified state
### Aliases: reset

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
##D ## Create a file, add and commit
##D writeLines("Hello world!", file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D commit_1 <- commit(repo, "Commit message")
##D 
##D ## Change and stage the file
##D writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "test-1.txt"))
##D add(repo, 'test-1.txt')
##D status(repo)
##D 
##D ## Unstage file
##D reset(repo, 'test-1.txt')
##D status(repo)
##D 
##D ## Make one more commit
##D add(repo, 'test-1.txt')
##D commit(repo, "Next commit message")
##D 
##D ## Create one more file
##D writeLines("Hello world!", file.path(path, "test-2.txt"))
##D 
##D ## 'soft' reset to first commit and check status
##D reset(commit_1)
##D status(repo)
##D 
##D ## 'mixed' reset to first commit and check status
##D commit(repo, "Next commit message")
##D reset(commit_1, "mixed")
##D status(repo)
##D 
##D ## 'hard' reset to first commit and check status
##D add(repo, 'test-1.txt')
##D commit(repo, "Next commit message")
##D reset(commit_1, "hard")
##D status(repo)
## End(Not run)



