library(archivist.github)


### Name: addHooksToPrintGitHub
### Title: Add 'archivist' Hooks to 'rmarkdown' markdown/LaTeX Reports and
###   Archive Artifact on GitHub
### Aliases: addHooksToPrintGitHub

### ** Examples


## Not run: 
##D # only in Rmd report, links to GitHub repository and archive artifact
##D #' # empty GitHub Repository creation
##D authoriseGitHub(ClientID, ClientSecret) -> github_token
##D # authoriseGitHub also does: aoptions("github_token", github_token)
##D aoptions("user", user.name)
##D aoptions("password", user.password)
##D createGitHubRepo("Museum", default = TRUE) # it does aoptions("repo", "Museum")
##D 
##D addHooksToPrintGitHub(class="ggplot") # takes default parameters from ?aoptions
##D qplot(mpg, wt, data = mtcars, geom = "path")
##D summaryRemoteRepo()
##D showRemoteRepo()
## End(Not run)



