library(psychmeta)


### Name: .integrate_dmod
### Title: Integration function for computing parametric signed or unsigned
###   d_Mod effect sizes for a single focal group
### Aliases: .integrate_dmod
### Keywords: internal

### ** Examples

## Not run: 
##D # Example for computing \eqn{d_{Mod_{Signed}}}{d_Mod_Signed}
##D .integrate_dmod(referent_int = -.05, referent_slope = .5,
##D               focal_int = -.05, focal_slope = .3,
##D               focal_mean_x = -.5, focal_sd_x = 1,
##D               referent_sd_y = 1, focal_min_x = -Inf, focal_max_x = Inf,
##D               signed = TRUE)
##D 
##D # Example for computing \eqn{d_{Mod_{Unsigned}}}{d_Mod_Unsigned}
##D .integrate_dmod(referent_int = -.05, referent_slope = .5,
##D               focal_int = -.05, focal_slope = .3,
##D               focal_mean_x = -.5, focal_sd_x = 1,
##D               referent_sd_y = 1, focal_min_x = -Inf, focal_max_x = Inf,
##D               signed = FALSE)
## End(Not run)



