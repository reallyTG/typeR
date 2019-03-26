library(git2r)


### Name: cred_token
### Title: Create a new personal access token credential object
### Aliases: cred_token

### ** Examples

## Not run: 
##D ## Create a personal access token credential object.
##D ## This example assumes that the token is stored in
##D ## the 'GITHUB_PAT' environmental variable.
##D repo <- repository("git2r")
##D cred <- cred_token()
##D push(repo, credentials = cred)
## End(Not run)



