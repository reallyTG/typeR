library(packrat)


### Name: lockfile-metadata
### Title: Get / Set packrat lockfile metadata
### Aliases: lockfile-metadata set_lockfile_metadata get_lockfile_metadata

### ** Examples

## Not run: 
##D # changes repos url
##D repos <- old_repos <- get_lockfile_metadata("repos")
##D repos
##D repos["CRAN"] <- "https://cran.r-project.org/"
##D set_lockfile_metadata(repos = repos)
##D get_lockfile_metadata("repos")
##D # setting back old state
##D # set_lockfile_metadata(repos = old_repos)
##D 
##D # changes R version
##D rver <- old_rver <- get_lockfile_metadata("r_version")
##D rver
##D rver <- "3.4.1"
##D set_lockfile_metadata(r_version = rver)
##D get_lockfile_metadata("r_version")
##D # Setting back old state
##D # set_lockfile_metadata(r_version = old_rver)
## End(Not run)



