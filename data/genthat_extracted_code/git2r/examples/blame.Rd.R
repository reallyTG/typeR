library(git2r)


### Name: blame
### Title: Get blame for file
### Aliases: blame

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a first user and commit a file
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D writeLines("Hello world!", file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "First commit message")
##D 
##D ## Create a second user and change the file
##D config(repo, user.name="Bob", user.email="bob@example.org")
##D writeLines(c("Hello world!", "HELLO WORLD!", "HOLA"),
##D            file.path(path, "example.txt"))
##D add(repo, "example.txt")
##D commit(repo, "Second commit message")
##D 
##D ## Check blame
##D blame(repo, "example.txt")
## End(Not run)



