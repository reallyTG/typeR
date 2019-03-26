library(R.utils)


### Name: withRepos
### Title: Evaluate an R expression with repositories set temporarily
### Aliases: withRepos
### Keywords: IO programming

### ** Examples
## Not run: 
##D   # Install from BioC related repositories only
##D   withRepos(install.packages("edgeR"), repos="[[BioC]]")
##D 
##D   # Install from CRAN or BioC related repositories only
##D   withRepos(install.packages("edgeR"), repos=c("CRAN", "[[BioC]]"))
##D 
##D   # Install from mainstream repositories only (same as previous)
##D   withRepos(install.packages("edgeR"), repos="[[mainstream]]")
##D 
##D   # Install from R-Forge and mainstream repositories only
##D   withRepos(install.packages("R.utils"), repos="[[R-Forge]]")
##D 
##D   # Update only CRAN packages
##D   withRepos(update.packages(ask=FALSE), repos="[[CRAN]]")
##D 
##D   # Update only Bioconductor packages
##D   withRepos(update.packages(ask=FALSE), repos="[[BioC]]")
## End(Not run)


