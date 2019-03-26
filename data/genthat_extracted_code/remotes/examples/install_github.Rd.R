library(remotes)


### Name: install_github
### Title: Attempts to install a package directly from GitHub.
### Aliases: install_github

### ** Examples

## Not run: 
##D install_github("klutometis/roxygen")
##D install_github("wch/ggplot2")
##D install_github(c("rstudio/httpuv", "rstudio/shiny"))
##D install_github(c("hadley/httr@v0.4", "klutometis/roxygen#142",
##D   "mfrasca/r-logging/pkg"))
##D 
##D # To install from a private repo, use auth_token with a token
##D # from https://github.com/settings/applications. You only need the
##D # repo scope. Best practice is to save your PAT in env var called
##D # GITHUB_PAT.
##D install_github("hadley/private", auth_token = "abc")
##D 
## End(Not run)



