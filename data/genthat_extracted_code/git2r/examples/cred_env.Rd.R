library(git2r)


### Name: cred_env
### Title: Create a new environmental credential object
### Aliases: cred_env

### ** Examples

## Not run: 
##D ## Create an environmental credential object for the username and
##D ## password.
##D cred <- cred_env("NAME_OF_ENV_VARIABLE_WITH_USERNAME",
##D                  "NAME_OF_ENV_VARIABLE_WITH_PASSWORD")
##D repo <- repository("git2r")
##D push(repo, credentials = cred)
## End(Not run)



