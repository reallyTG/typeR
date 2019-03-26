library(git2r)


### Name: is_merge
### Title: Is merge
### Aliases: is_merge

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines(c("First line in file 1.", "Second line in file 1."),
##D            file.path(path, "example-1.txt"))
##D add(repo, "example-1.txt")
##D commit(repo, "First commit message")
##D 
##D ## Create and add one more file
##D writeLines(c("First line in file 2.", "Second line in file 2."),
##D            file.path(path, "example-2.txt"))
##D add(repo, "example-2.txt")
##D commit(repo, "Second commit message")
##D 
##D ## Create a new branch 'fix'
##D checkout(repo, "fix", create = TRUE)
##D 
##D ## Update 'example-1.txt' (swap words in first line) and commit
##D writeLines(c("line First in file 1.", "Second line in file 1."),
##D            file.path(path, "example-1.txt"))
##D add(repo, "example-1.txt")
##D commit(repo, "Third commit message")
##D 
##D checkout(repo, "master")
##D 
##D ## Update 'example-2.txt' (swap words in second line) and commit
##D writeLines(c("First line in file 2.", "line Second in file 2."),
##D            file.path(path, "example-2.txt"))
##D add(repo, "example-2.txt")
##D commit(repo, "Fourth commit message")
##D 
##D ## Merge 'fix'
##D merge(repo, "fix")
##D 
##D ## Display parents of last commit
##D parents(lookup(repo, branch_target(repository_head(repo))))
##D 
##D ## Check that last commit is a merge
##D is_merge(lookup(repo, branch_target(repository_head(repo))))
## End(Not run)



