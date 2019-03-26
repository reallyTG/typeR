library(git2r)


### Name: merge_base
### Title: Find a merge base between two commits
### Aliases: merge_base

### ** Examples

## Not run: 
##D ## Create a directory in tempdir
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D 
##D ## Initialize a repository
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Master branch", file.path(path, "master_branch.txt"))
##D add(repo, "master_branch.txt")
##D commit_1 <- commit(repo, "Commit message 1")
##D 
##D ## Create first branch, checkout, add file and commit
##D branch_1 <- branch_create(commit_1, "branch_1")
##D checkout(branch_1)
##D writeLines("Branch 1", file.path(path, "branch_1.txt"))
##D add(repo, "branch_1.txt")
##D commit_2 <- commit(repo, "Commit message branch_1")
##D 
##D ## Create second branch, checkout, add file and commit
##D branch_2 <- branch_create(commit_1, "branch_2")
##D checkout(branch_2)
##D writeLines("Branch 2", file.path(path, "branch_2.txt"))
##D add(repo, "branch_2.txt")
##D commit_3 <- commit(repo, "Commit message branch_2")
##D 
##D ## Check that merge base equals commit_1
##D stopifnot(identical(merge_base(commit_2, commit_3), commit_1))
## End(Not run)



