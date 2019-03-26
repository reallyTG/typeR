library(git2r)


### Name: parents
### Title: Parents
### Aliases: parents

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("First line.",
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_1 <- commit(repo, "First commit message")
##D 
##D ## commit_1 has no parents
##D parents(commit_1)
##D 
##D ## Update 'example.txt' and commit
##D writeLines(c("First line.", "Second line."),
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit_2 <- commit(repo, "Second commit message")
##D 
##D ## commit_2 has commit_1 as parent
##D parents(commit_2)
## End(Not run)



