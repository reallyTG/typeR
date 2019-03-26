library(ss3sim)


### Name: standardize_bounds
### Title: Standardize the bounds of the estimation model control file.
### Aliases: standardize_bounds

### ** Examples

## Not run: 
##D temp_path <- file.path(tempdir(), "standardize-bounds-example")
##D dir.create(temp_path, showWarnings = FALSE)
##D wd <- getwd()
##D setwd(temp_path)
##D 
##D ## Set to the path and filename of the OM and EM control files
##D OM.ctl <- system.file("extdata", "models", "cod-om", "codOM.ctl",
##D   package = "ss3sim")
##D EM.ctl <- system.file("extdata", "models", "cod-em", "codEM.ctl",
##D   package = "ss3sim")
##D file.copy(OM.ctl, "om.ctl")
##D file.copy(EM.ctl, "em.ctl")
##D 
##D ## Use SS_parlines to get the proper names for parameters for the data frame
##D om.pars <- r4ss::SS_parlines(ctlfile="om.ctl")
##D em.pars <- r4ss::SS_parlines(ctlfile="em.ctl")
##D 
##D ## Set percentages to make lower and upper bounds
##D lo.percent<-rep(.5,11)
##D hi.percent<-c(500,1000,1000,rep(500,8))
##D 
##D ##Populate data frame using EM parameter names and percentages
##D percent_df<-data.frame(Label=as.character(em.pars[c(1:6,17,27:30),"Label"]),
##D   lo=lo.percent,hi=hi.percent)
##D 
##D ##Run function
##D standardize_bounds(percent_df = percent_df, dir = temp_path, em_ctl_file = "em.ctl",
##D                    om_ctl_file = "om.ctl")
##D unlink(temp_path, recursive = TRUE)
##D 
##D setwd(wd)
## End(Not run)



