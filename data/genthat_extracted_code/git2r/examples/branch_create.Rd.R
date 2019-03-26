library(git2r)


### Name: branch_create
### Title: Create a branch
### Aliases: branch_create

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
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## Create a branch
##D branch_1 <- branch_create(commit_1, name = "test-branch")
##D 
##D ## Add one more commit
##D writeLines(c("Hello world!", "HELLO WORLD!"), file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_2 <- commit(repo, "Another commit message")
##D 
##D ## Create a branch with the same name should fail
##D try(branch_create(commit_2, name = "test-branch"), TRUE)
##D 
##D ## Force it
##D branch_2 <- branch_create(commit_2, name = "test-branch", force = TRUE)
## End(Not run)



