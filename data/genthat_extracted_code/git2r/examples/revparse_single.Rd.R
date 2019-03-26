library(git2r)


### Name: revparse_single
### Title: Revparse
### Aliases: revparse_single

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
##D writeLines("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D            con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "First commit message")
##D 
##D # Change file and commit
##D writeLines(c("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do",
##D              "eiusmod tempor incididunt ut labore et dolore magna aliqua."),
##D              con = file.path(path, "test.txt"))
##D add(repo, "test.txt")
##D commit(repo, "Second commit message")
##D 
##D revparse_single(repo, "HEAD^")
##D revparse_single(repo, "HEAD:test.txt")
## End(Not run)



