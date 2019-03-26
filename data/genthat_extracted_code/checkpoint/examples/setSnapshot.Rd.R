library(checkpoint)


### Name: setSnapshot
### Title: Set default CRAN repository to MRAN snapshot date.
### Aliases: setSnapshot

### ** Examples

# Empty date field returns current repo

oldRepos <- getOption("repos")
setSnapshot()

# Valid snapshot date
# Connects to MRAN to check for valid URL, so skip on CRAN
## Not run: 
##D setSnapshot("2014-11-16")
## End(Not run)

# Invalid snapshot date (in future), returns error
## Not run: 
##D setSnapshot("2100-01-01")
## End(Not run)

options(repos = oldRepos)



