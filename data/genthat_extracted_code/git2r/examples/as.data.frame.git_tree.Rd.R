library(git2r)


### Name: as.data.frame.git_tree
### Title: Coerce entries in a git_tree to a 'data.frame'
### Aliases: as.data.frame.git_tree

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D dir.create(file.path(path, "subfolder"))
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create three files and commit
##D writeLines("First file",  file.path(path, "example-1.txt"))
##D writeLines("Second file", file.path(path, "subfolder/example-2.txt"))
##D writeLines("Third file",  file.path(path, "example-3.txt"))
##D add(repo, c("example-1.txt", "subfolder/example-2.txt", "example-3.txt"))
##D commit(repo, "Commit message")
##D 
##D ## Display tree
##D tree(last_commit(repo))
##D 
##D ## Coerce tree to a data.frame
##D df <- as(tree(last_commit(repo)), "data.frame")
##D df
## End(Not run)



