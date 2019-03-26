library(mvbutils)


### Name: help
### Title: The R help system
### Aliases: help ?
### Keywords: misc

### ** Examples

help()
help(help)              # the same
help(lapply)
help("for")             # or ?"for", but quotes/backticks are needed
help(package="splines") # get help even when package is not loaded
topi <- "women"
help(topi)
try(help("bs", try.all.packages=FALSE)) # reports not found (an error)
help("bs", try.all.packages=TRUE)       # reports can be found
                                        # in package 'splines'
## For programmatic use:
topic <- "family"; pkg_ref <- "stats"
help((topic), (pkg_ref))



