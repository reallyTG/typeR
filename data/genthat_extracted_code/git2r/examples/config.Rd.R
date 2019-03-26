library(git2r)


### Name: config
### Title: Config
### Aliases: config

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern = "git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Set user name and email.
##D config(repo, user.name = "Alice", user.email = "alice@example.org")
##D 
##D ## Display configuration
##D config(repo)
##D 
##D ## Delete user email.
##D config(repo, user.email = NULL)
##D 
##D ## Display configuration
##D config(repo)
## End(Not run)



