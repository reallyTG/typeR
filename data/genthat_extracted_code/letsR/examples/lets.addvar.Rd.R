library(letsR)


### Name: lets.addvar
### Title: Add variables (in raster format) to a PresenceAbscence object
### Aliases: lets.addvar

### ** Examples

## Not run: 
##D data(temp)  # Global mean temperature
##D data(PAM)  # Phyllomedusa presence-absence matrix
##D # Mean temperature
##D PAM_temp_mean <- lets.addvar(PAM, temp)
##D # Standard deviation of temperature
##D PAM_temp_sd <- lets.addvar(PAM, temp, fun = sd, onlyvar = TRUE)
##D # Mean and SD in the PAM
##D PAM_temp_mean_sd <- cbind(PAM_temp_mean, PAM_temp_sd)
## End(Not run)




