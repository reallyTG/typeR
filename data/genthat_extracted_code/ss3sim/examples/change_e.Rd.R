library(ss3sim)


### Name: change_e
### Title: Methods to alter which parameters are estimated in a SS3 '.ctl'
###   file.
### Aliases: change_e

### ** Examples

## Not run: 
##D library(r4ss)
##D # Create a temporary folder for the output and set the working directory:
##D temp_path <- file.path(tempdir(), "ss3sim-tv-example")
##D dir.create(temp_path, showWarnings = FALSE)
##D wd <- getwd()
##D setwd(temp_path)
##D 
##D d <- system.file("extdata", package = "ss3sim")
##D ctl_file <- paste0(d, "/models/cod-om/codOM.ctl")
##D data.old <- r4ss::SS_readdat(file.path(d, "models", "cod-om", "codOM.dat"))
##D change_e(ctl_file_in = ctl_file, ctl_file_out = "change_e.ctl",
##D          dat_list = data.old, for_file_in = "forecast.ss",
##D          natM_type = "n_breakpoints", natM_n_breakpoints = c(1, 4),
##D          natM_lorenzen = NULL, natM_val = c(.2, 3, 0.4, 5),
##D          par_name = c("_steep", "SizeSel_1P_1_Fishery"),
##D          par_int = c(0.3, 40), par_phase = c(3, 2),
##D          forecast_num = 0, run_change_e_full = TRUE )
##D # clean up
##D file.remove("change_e.ctl")
##D setwd(wd)
## End(Not run)



