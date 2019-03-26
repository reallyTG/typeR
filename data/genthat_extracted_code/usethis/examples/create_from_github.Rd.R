library(usethis)


### Name: create_from_github
### Title: Create a project from a GitHub repo
### Aliases: create_from_github

### ** Examples

## Not run: 
##D create_from_github("r-lib/usethis")
##D 
##D create_from_github("r-lib/usethis", protocol = "https")
##D 
##D ## various ways code can look when specifying ssh credential explicitly
##D create_from_github("r-lib/usethis", credentials = git2r::cred_ssh_key())
##D 
##D cred <- git2r::cred_ssh_key(
##D   publickey = "path/to/id_rsa.pub",
##D   privatekey = "path/to/id_rsa"
##D )
##D create_from_github("cran/TailRank", credentials = cred)
## End(Not run)



