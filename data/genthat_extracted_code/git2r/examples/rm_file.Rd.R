library(git2r)


### Name: rm_file
### Title: Remove files from the working tree and from the index
### Aliases: rm_file

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
##D commit(repo, "First commit message")
##D 
##D ## Remove file
##D rm_file(repo, "file-to-remove.txt")
##D 
##D ## View status of repository
##D status(repo)
## End(Not run)



