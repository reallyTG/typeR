library(inlabru)


### Name: init.tutorial
### Title: Global setting for tutorial sessions
### Aliases: init.tutorial

### ** Examples

## Not run: 
##D # Note: Only run this if you want to change the inlabru options for this session
##D 
##D # Determine current bru default:
##D bo = bru.options()
##D 
##D # By default, INLA's integration strategy is set to the INLA default 'auto':
##D bo$inla.options$control.inla
##D 
##D # Now, let's run init.tutorial() to make empirical Bayes the default 
##D # integration method when \code{bru} calls \code{inla}
##D 
##D init.tutorial()
##D 
##D # Check if it worked:
##D bru.options()$inla.options$control.inla
##D 
## End(Not run)




