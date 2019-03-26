library(git2r)


### Name: discover_repository
### Title: Find path to repository for any file
### Aliases: discover_repository

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
##D            file.path(path, "example-1.txt"))
##D add(repo, "example-1.txt")
##D commit(repo, "First commit message")
##D 
##D ## Create a second file. The file is not added for version control
##D ## in the repository.
##D dir.create(file.path(path, "example"))
##D file_2 <- file.path(path, "example/example-2.txt")
##D writeLines("Not under version control", file_2)
##D 
##D ## Find the path to the repository using the path to the second file
##D discover_repository(file_2)
##D 
##D ## Demonstrate the 'ceiling' argument
##D wd <- workdir(repo)
##D dir.create(file.path(wd, "temp"))
##D 
##D ## Lookup repository in 'file.path(wd, "temp")'. Should return NULL
##D discover_repository(file.path(wd, "temp"), ceiling = 0)
##D 
##D ## Lookup repository in parent to 'file.path(wd, "temp")'.
##D ## Should not return NULL
##D discover_repository(file.path(wd, "temp"), ceiling = 1)
## End(Not run)



