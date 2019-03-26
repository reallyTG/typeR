library(git2r)


### Name: odb_objects
### Title: List all objects available in the database
### Aliases: odb_objects

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
##D commit(repo, "Commit message 1")
##D 
##D ## Create tag
##D tag(repo, "Tagname", "Tag message")
##D 
##D ## List objects in repository
##D odb_objects(repo)
## End(Not run)



