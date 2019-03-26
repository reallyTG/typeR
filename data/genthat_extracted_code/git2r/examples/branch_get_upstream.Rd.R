library(git2r)


### Name: branch_get_upstream
### Title: Get remote tracking branch
### Aliases: branch_get_upstream

### ** Examples

## Not run: 
##D ## Initialize two temporary repositories
##D path_bare <- tempfile(pattern="git2r-")
##D path_repo <- tempfile(pattern="git2r-")
##D dir.create(path_bare)
##D dir.create(path_repo)
##D repo_bare <- init(path_bare, bare = TRUE)
##D repo <- clone(path_bare, path_repo)
##D 
##D ## Config user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Write to a file and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path_repo, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Push commits from repository to bare repository
##D ## Adds an upstream tracking branch to branch 'master'
##D push(repo, "origin", "refs/heads/master")
##D 
##D ## Get remote tracking branch
##D branch_get_upstream(repository_head(repo))
## End(Not run)



