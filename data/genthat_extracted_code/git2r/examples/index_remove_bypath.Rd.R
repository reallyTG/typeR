library(git2r)


### Name: index_remove_bypath
### Title: Remove an index entry corresponding to a file on disk
### Aliases: index_remove_bypath

### ** Examples

## Not run: 
##D ## Initialize a repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file
##D writeLines("Hello world!", file.path(path, "file-to-remove.txt"))
##D 
##D ## Add file to repository
##D add(repo, "file-to-remove.txt")
##D 
##D ## View status of repository
##D status(repo)
##D 
##D ## Remove file
##D index_remove_bypath(repo, "file-to-remove.txt")
##D 
##D ## View status of repository
##D status(repo)
## End(Not run)



