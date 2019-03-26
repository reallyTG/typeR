library(shinystan)


### Name: launch_shinystan
### Title: Launch the 'ShinyStan' app
### Aliases: launch_shinystan launch_shinystan.default
###   launch_shinystan.shinystan

### ** Examples

## Not run: 
##D #######################################
##D # Example 1: 'sso' is a shinystan object
##D #######################################
##D 
##D # Just launch shinystan
##D launch_shinystan(sso)
##D 
##D # Launch shinystan and replace sso with an updated version of itself
##D # if any changes are made to sso while using the app
##D sso <- launch_shinystan(sso)
##D 
##D # Launch shinystan but save any changes made to sso while running the app
##D # in a new shinystan object sso2. sso will remained unchanged. 
##D sso2 <- launch_shinystan(sso) 
##D 
##D #######################################
##D # Example 2: 'sf' is a stanfit object
##D #######################################
##D 
##D # Just launch shinystan
##D launch_shinystan(sf)
##D 
##D # Launch shinystan and save the resulting shinystan object
##D sf_sso <- launch_shinystan(sf)
##D 
##D # Now sf_sso is a shinystan object and so Example 1 (above) applies when
##D # using sf_sso. 
##D 
##D #######################################
##D # Example 3: 'fit' is an mcmc.list, array or list of matrices
##D #######################################
##D 
##D # First create shinystan object (see ?as.shinystan) for full details)
## End(Not run)




