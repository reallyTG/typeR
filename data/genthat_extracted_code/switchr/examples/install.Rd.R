library(switchr)


### Name: install_packages
### Title: install_packages
### Aliases: install_packages install_packages,character,character-method
###   install_packages,character,character
###   install_packages,character,missing-method
###   install_packages,character,missing
###   install_packages,SessionManifest,ANY-method
###   install_packages,SessionManifest,ANY
###   install_packages,character,SessionManifest-method
###   install_packages,character,SessionManifest
###   install_packages,character,PkgManifest-method
###   install_packages,character,PkgManifest

### ** Examples

## Not run: 
##D ## equivalent to install.packages, except it stores
##D ## package provenance and knows about bioconductor repos
##D install_packages("nlme")
##D 
##D ## install from a manifest
##D man = GithubManifest("gmbecker/fastdigest")
##D install_packages("fastdigest", man)
##D 
##D ## install a full seeding manifest
##D man2 = makeSeedMan("myotherlib")
##D install_packages(man2)
## End(Not run)



