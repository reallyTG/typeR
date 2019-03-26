library(git2r)


### Name: last_commit
### Title: Last commit
### Aliases: last_commit

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
##D 
##D ## Get last commit
##D last_commit(repo)
##D last_commit(path)
##D 
##D ## Coerce the last commit to a data.frame
##D as.data.frame(last_commit(path), "data.frame")
##D 
##D ## Summary of last commit in repository
##D summary(last_commit(repo))
## End(Not run)



