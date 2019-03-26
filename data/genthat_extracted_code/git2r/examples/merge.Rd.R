library(git2r)


### Name: merge.git_branch
### Title: Merge a branch into HEAD
### Aliases: merge.git_branch merge.git_repository merge.character

### ** Examples

## Not run: 
##D ## Create a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email = "alice@example.org")
##D 
##D ## Create a file, add and commit
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit_1 <- commit(repo, "Commit message 1")
##D 
##D ## Create first branch, checkout, add file and commit
##D checkout(repo, "branch1", create = TRUE)
##D writeLines("Branch 1", file.path(path, "branch-1.txt"))
##D add(repo, "branch-1.txt")
##D commit(repo, "Commit message branch 1")
##D 
##D ## Create second branch, checkout, add file and commit
##D b_2 <- branch_create(commit_1, "branch2")
##D checkout(b_2)
##D writeLines("Branch 2", file.path(path, "branch-2.txt"))
##D add(repo, "branch-2.txt")
##D commit(repo, "Commit message branch 2")
##D 
##D ## Make a change to 'test.txt'
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Second commit message branch 2")
##D 
##D ## Checkout master
##D checkout(repo, "master", force = TRUE)
##D 
##D ## Merge branch 1
##D merge(repo, "branch1")
##D 
##D ## Merge branch 2
##D merge(repo, "branch2")
##D 
##D ## Create third branch, checkout, change file and commit
##D checkout(repo, "branch3", create=TRUE)
##D writeLines(c("Lorem ipsum dolor amet sit, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Commit message branch 3")
##D 
##D ## Checkout master and create a change that creates a merge conflict
##D checkout(repo, "master", force=TRUE)
##D writeLines(c("Lorem ipsum dolor sit amet, adipisicing consectetur elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Some commit message branch 1")
##D 
##D ## Merge branch 3
##D merge(repo, "branch3")
##D 
##D ## Check status; Expect to have one unstaged unmerged conflict.
##D status(repo)
## End(Not run)



