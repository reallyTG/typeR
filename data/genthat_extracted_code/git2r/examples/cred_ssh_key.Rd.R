library(git2r)


### Name: cred_ssh_key
### Title: Create a new passphrase-protected ssh key credential object
### Aliases: cred_ssh_key

### ** Examples

## Not run: 
##D ## Create a ssh key credential object. It can optionally be
##D ## passphrase-protected
##D cred <- cred_ssh_key(ssh_path("id_rsa.pub"), ssh_path("id_rsa"))
##D repo <- repository("git2r")
##D push(repo, credentials = cred)
## End(Not run)



