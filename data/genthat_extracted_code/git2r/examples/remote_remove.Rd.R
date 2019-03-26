library(git2r)


### Name: remote_remove
### Title: Remove a remote
### Aliases: remote_remove

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Add a remote
##D remote_add(repo, "playground", "https://example.org/git2r/playground")
##D remotes(repo)
##D remote_url(repo, "playground")
##D 
##D ## Rename a remote
##D remote_rename(repo, "playground", "foobar")
##D remotes(repo)
##D remote_url(repo, "foobar")
##D 
##D ## Set remote url
##D remote_set_url(repo, "foobar", "https://example.org/git2r/foobar")
##D remotes(repo)
##D remote_url(repo, "foobar")
##D 
##D ## Remove a remote
##D remote_remove(repo, "foobar")
##D remotes(repo)
## End(Not run)



