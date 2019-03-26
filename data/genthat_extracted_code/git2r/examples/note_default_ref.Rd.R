library(git2r)


### Name: note_default_ref
### Title: Default notes reference
### Aliases: note_default_ref

### ** Examples

## Not run: 
##D ## Create and initialize a repository in a temporary directory
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D config(repo, user.name="Alice", user.email="alice@example.org")
##D 
##D ## View default notes reference
##D note_default_ref(repo)
## End(Not run)



