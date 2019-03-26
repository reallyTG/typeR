library(git2r)


### Name: is_tree
### Title: Check if object is S3 class git_tree
### Aliases: is_tree
### Keywords: methods

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
##D tree_1 <- tree(commit_1)
##D 
##D ## Check if tree
##D is_tree(commit_1)
##D is_tree(tree_1)
## End(Not run)



