library(git2r)


### Name: is_blob
### Title: Check if object is S3 class git_blob
### Aliases: is_blob

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Commit a text file
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "First commit message")
##D blob_1 <- tree(commit_1)["example.txt"]
##D 
##D ## Check if blob
##D is_blob(commit_1)
##D is_blob(blob_1)
## End(Not run)



