library(usethis)


### Name: use_github
### Title: Connect a local repo with GitHub
### Aliases: use_github

### ** Examples

## Not run: 
##D pkgpath <- file.path(tempdir(), "testpkg")
##D create_package(pkgpath) # creates package below temp directory
##D 
##D ## now, working inside "testpkg", initialize git repository
##D use_git()
##D 
##D ## create github repository and configure as git remote
##D use_github()                   ## to use default ssh protocol
##D use_github(protocol = "https") ## to use https
## End(Not run)



