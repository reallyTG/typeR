library(git2r)


### Name: is_detached
### Title: Check if HEAD of repository is detached
### Aliases: is_detached

### ** Examples

## Not run: 
##D ## Create and initialize a repository in a temporary directory
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "Commit message 1")
##D 
##D ## Change file, add and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D              file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Commit message 2")
##D 
##D ## HEAD of repository is not detached
##D is_detached(repo)
##D 
##D ## Checkout first commit
##D checkout(commit_1)
##D 
##D ## HEAD of repository is detached
##D is_detached(repo)
## End(Not run)



