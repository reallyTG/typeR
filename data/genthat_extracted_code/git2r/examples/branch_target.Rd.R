library(git2r)


### Name: branch_target
### Title: Get target (sha) pointed to by a branch
### Aliases: branch_target

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Config user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Get target (sha) pointed to by 'master' branch
##D branch_target(repository_head(repo))
## End(Not run)



