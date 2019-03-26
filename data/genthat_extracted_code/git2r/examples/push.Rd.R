library(git2r)


### Name: push
### Title: Push
### Aliases: push

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
##D ## Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            file.path(path_repo, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Second commit message")
##D 
##D ## Push commits from repository to bare repository
##D push(repo)
##D 
##D ## List commits in repository and bare repository
##D commits(repo)
##D commits(repo_bare)
## End(Not run)



