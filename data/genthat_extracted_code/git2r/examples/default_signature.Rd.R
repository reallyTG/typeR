library(git2r)


### Name: default_signature
### Title: Get the signature
### Aliases: default_signature

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
##D ## Get the default signature
##D default_signature(repo)
##D 
##D ## Change user
##D config(repo, user.name="Bob", user.email="bob@example.org")
##D 
##D ## Get the default signature
##D default_signature(repo)
## End(Not run)



