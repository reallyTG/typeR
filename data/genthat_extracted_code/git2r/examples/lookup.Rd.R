library(git2r)


### Name: lookup
### Title: Lookup
### Aliases: lookup

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## Create tag
##D tag(repo, "Tagname", "Tag message")
##D 
##D ## First, get SHAs to lookup in the repository
##D sha_commit <- commit_1@sha
##D sha_tree <- tree(commit_1)@sha
##D sha_blob <- tree(commit_1)["example.txt"]$sha
##D sha_tag <- tags(repo)[[1]]@sha
##D 
##D ## SHAs
##D sha_commit
##D sha_tree
##D sha_blob
##D sha_tag
##D 
##D ## Lookup objects
##D lookup(repo, sha_commit)
##D lookup(repo, sha_tree)
##D lookup(repo, sha_blob)
##D lookup(repo, sha_tag)
##D 
##D ## Lookup objects, using only the first seven characters
##D lookup(repo, substr(sha_commit, 1, 7))
##D lookup(repo, substr(sha_tree, 1, 7))
##D lookup(repo, substr(sha_blob, 1, 7))
##D lookup(repo, substr(sha_tag, 1, 7))
## End(Not run)



