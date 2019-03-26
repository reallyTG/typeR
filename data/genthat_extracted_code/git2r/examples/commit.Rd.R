library(git2r)


### Name: commit
### Title: Commit
### Aliases: commit

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
##D ## Write to a file and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
## End(Not run)



