library(nat.templatebrains)


### Name: download_reg_repo
### Title: Download and register git repository containing registrations
### Aliases: download_reg_repo

### ** Examples

## find the root location of all registration directories
local_reg_dir_for_url()
## Not run: 
##D ## Add the two main jefferislab bridging and mirroring registration
##D # collections for Drosophila brains from github.com.
##D download_reg_repo("jefferislab/BridgingRegistrations")
##D download_reg_repo("jefferislab/MirrorRegistrations")
##D 
##D ## update all current registration repositories
##D update_reg_repos()
## End(Not run)



