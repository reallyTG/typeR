library(git2r)


### Name: [.git_tree
### Title: Extract object from tree
### Aliases: [.git_tree

### ** Examples

## Not run: 
##D ##' Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D dir.create(file.path(path, "subfolder"))
##D repo <- init(path)
##D 
##D ##' Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ##' Create three files and commit
##D writeLines("First file",  file.path(path, "example-1.txt"))
##D writeLines("Second file", file.path(path, "subfolder/example-2.txt"))
##D writeLines("Third file",  file.path(path, "example-3.txt"))
##D add(repo, c("example-1.txt", "subfolder/example-2.txt", "example-3.txt"))
##D new_commit <- commit(repo, "Commit message")
##D 
##D ##' Pick a tree in the repository
##D tree_object <- tree(new_commit)
##D 
##D ##' Display tree
##D tree_object
##D 
##D ##' Select item by name
##D tree_object["example-1.txt"]
##D 
##D ##' Select first item in tree
##D tree_object[1]
##D 
##D ##' Select first three items in tree
##D tree_object[1:3]
##D 
##D ##' Select all blobs in tree
##D tree_object[vapply(as(tree_object, 'list'), is_blob, logical(1))]
## End(Not run)



