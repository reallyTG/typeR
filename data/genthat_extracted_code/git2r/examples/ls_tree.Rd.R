library(git2r)


### Name: ls_tree
### Title: List the contents of a tree object
### Aliases: ls_tree

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
##D ## Traverse tree entries and its subtrees.
##D ## Various approaches that give identical result.
##D ls_tree(tree = tree(last_commit(path)))
##D ls_tree(tree = tree(last_commit(repo)))
##D ls_tree(repo = path)
##D ls_tree(repo = repo)
##D 
##D ## Skip content in subfolder
##D ls_tree(repo = repo, recursive = FALSE)
##D 
##D ## Start in subfolder
##D ls_tree(tree = "HEAD:subfolder", repo = repo)
## End(Not run)



