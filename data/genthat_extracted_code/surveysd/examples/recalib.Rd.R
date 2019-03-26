library(surveysd)


### Name: recalib
### Title: Calibrate weights
### Aliases: recalib

### ** Examples

## Not run: 
##D 
##D eusilc <- demo.eusilc(prettyNames = TRUE)
##D 
##D dat_boot <- draw.bootstrap(eusilc, REP = 10, hid = "hid", weights = "pWeight",
##D                            strata = "region", period = "year")
##D 
##D # calibrate weight for bootstrap replicates
##D dat_boot_calib <- recalib(dat_boot, conP.var = "gender", conH.var = "region")
##D 
##D 
##D # calibrate on other variables
##D dat_boot_calib <- recalib(dat_boot, conP.var = c("gender", "age"),
##D                           conH.var = c("region", "hsize"))
## End(Not run)




