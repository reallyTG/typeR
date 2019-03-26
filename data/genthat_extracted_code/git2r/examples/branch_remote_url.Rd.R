library(git2r)


### Name: branch_remote_url
### Title: Remote url of a branch
### Aliases: branch_remote_url

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
##D ## Get remote url of tracking branch to branch 'master'
##D branch_remote_url(branch_get_upstream(repository_head(repo)))
## End(Not run)



