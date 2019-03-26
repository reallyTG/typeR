library(git2r)


### Name: as.data.frame.git_repository
### Title: Coerce Git repository to a 'data.frame'
### Aliases: as.data.frame.git_repository

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create a user
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## Create three files and commit
##D writeLines("First file",  file.path(path, "example-1.txt"))
##D writeLines("Second file", file.path(path, "example-2.txt"))
##D writeLines("Third file",  file.path(path, "example-3.txt"))
##D add(repo, "example-1.txt")
##D commit(repo, "Commit first file")
##D add(repo, "example-2.txt")
##D commit(repo, "Commit second file")
##D add(repo, "example-3.txt")
##D commit(repo, "Commit third file")
##D 
##D ## Coerce commits to a data.frame
##D df <- as(repo, "data.frame")
##D df
## End(Not run)



