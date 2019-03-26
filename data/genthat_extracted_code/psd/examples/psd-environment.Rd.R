library(psd)


### Name: psd-environment
### Title: Various environment manipulation functions.
### Aliases: get_adapt_history get_psd_env_name get_psd_env_pointer
###   last_psd new_adapt_history psd-environment psd_envAssign
###   psd_envAssignGet psd_envClear psd_envGet psd_envList psd_envRefresh
###   psd_envStatus update_adapt_history update_adapt_history.default
###   update_adapt_history.spec

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## psd working environment
##D ##
##D 
##D # Get some status information about the psd working environment
##D psd_envStatus()
##D 
##D # Get a list of all variables
##D psd_envList()
##D 
##D # Pull the variable "init" into .GlobalEnv
##D print(x <- psd_envGet("init"))
##D 
##D # Pull the adaptive history into .GlobalEnv
##D set.seed(1234)
##D X <- rnorm(1e3)
##D pspectrum(X)
##D get_adapt_history()
##D 
## End(Not run)#REX



