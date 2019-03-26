library(git2r)


### Name: fetch_heads
### Title: Get updated heads during the last fetch.
### Aliases: fetch_heads

### ** Examples

## Not run: 
##D ## Initialize three temporary repositories
##D path_bare <- tempfile(pattern="git2r-")
##D path_repo_1 <- tempfile(pattern="git2r-")
##D path_repo_2 <- tempfile(pattern="git2r-")
##D 
##D dir.create(path_bare)
##D dir.create(path_repo_1)
##D dir.create(path_repo_2)
##D 
##D bare_repo <- init(path_bare, bare = TRUE)
##D repo_1 <- clone(path_bare, path_repo_1)
##D repo_2 <- clone(path_bare, path_repo_2)
##D 
##D config(repo_1, user.name="Alice", user.email="alice@example.org")
##D config(repo_2, user.name="Bob", user.email="bob@example.org")
##D 
##D ## Add changes to repo 1
##D writeLines("Lorem ipsum dolor sit amet",
##D            con = file.path(path_repo_1, "example.txt"))
##D add(repo_1, "example.txt")
##D commit(repo_1, "Commit message")
##D 
##D ## Push changes from repo 1 to origin (bare_repo)
##D push(repo_1, "origin", "refs/heads/master")
##D 
##D ## Fetch changes from origin (bare_repo) to repo 2
##D fetch(repo_2, "origin")
##D 
##D ## List updated heads
##D fetch_heads(repo_2)
## End(Not run)



