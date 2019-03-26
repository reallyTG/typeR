library(segclust2d)


### Name: add_covariates
### Title: Covariate Calculations
### Aliases: add_covariates add_covariates.Move add_covariates.ltraj
###   add_covariates.data.frame

### ** Examples

## Not run: add_covariates(move_object, coord.names = c("x","y"), smoothed = T)
## Not run: 
##D data(simulmode)
##D simple_data <- simulmode[,c("dateTime","x","y")]
##D full_data   <- add_covariates(simple_data, coord.names = c("x","y"),
##D  timecol = "dateTime",smoothed = TRUE, units ="min")
## End(Not run)



