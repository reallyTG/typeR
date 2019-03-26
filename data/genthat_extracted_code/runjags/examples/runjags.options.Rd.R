library(runjags)


### Name: runjags.options
### Title: Options for the runjags package
### Aliases: runjags.options runJAGS.options runjags.getOption
###   runJAGS.getOption
### Keywords: methods

### ** Examples


## Not run: 
##D 
##D # Create a list of options in the global environment (perhaps in an
##D # R startup profile file) BEFORE load()ing runjags:
##D .runjags.options <- list(inits.warning=FALSE, rng.warning=FALSE)
##D # Or if it is run in a different environment:
##D # .runjags.options <<- list(inits.warning=FALSE, rng.warning=FALSE)
##D 
##D # Then load runjags and verify that the options have been set:
##D library('runjags')
##D print(runjags.options())
##D 
##D 
##D # Change the default option to remove all feedback provided by
##D # runjags and JAGS/rjags (only errors will be printed to screen):
##D runjags.options(silent.jags=TRUE, silent.runjags=TRUE)
##D 
## End(Not run)




