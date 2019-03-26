library(ss3sim)


### Name: ss3sim_base
### Title: Base wrapper function to run an ss3sim simulation
### Aliases: ss3sim_base

### ** Examples

## Not run: 
##D # Create a temporary folder for the output and set the working directory:
##D temp_path <- file.path(tempdir(), "ss3sim-base-example")
##D dir.create(temp_path, showWarnings = FALSE)
##D wd <- getwd()
##D setwd(temp_path)
##D 
##D # Find the data in the ss3sim package:
##D d <- system.file("extdata", package = "ss3sim")
##D om <- paste0(d, "/models/cod-om")
##D em <- paste0(d, "/models/cod-em")
##D case_folder <- paste0(d, "/eg-cases")
##D 
##D # Pull in file paths from the package example data:
##D d <- system.file("extdata", package = "ss3sim")
##D om_dir <- paste0(d, "/models/cod-om")
##D em_dir <- paste0(d, "/models/cod-em")
##D a <- get_caseargs(folder = paste0(d, "/eg-cases"), scenario =
##D "F0-D0-M0-E0-cod")
##D 
##D ss3sim_base(iterations = 1, scenarios = "M0-F0-D0-E0-cod",
##D   f_params = a$F, index_params = a$index, lcomp_params = a$lcomp,
##D   agecomp_params = a$agecomp, tv_params = a$tv_params, estim_params = a$E,
##D   om_dir = om_dir, em_dir = em_dir)
##D unlink("M0-F0-D0-E0-cod", recursive = TRUE) # clean up
##D 
##D # Or, create the argument lists directly in R and skip the case file setup:
##D 
##D F0 <- list(years = 1913:2012, years_alter = 1913:2012, fvals = c(rep(0,
##D   25), rep(0.114, 75)))
##D 
##D index1 <- list(fleets = 2, years = list(seq(1974, 2012, by = 2)), sds_obs =
##D   list(0.1))
##D 
##D lcomp1 <- list(fleets = c(1, 2), Nsamp = list(100, 100), years =
##D   list(1938:2012, seq(1974, 2012, by = 2)), lengthbin_vector = NULL, cpar =
##D   c(1, 1))
##D 
##D agecomp1 <- list(fleets = c(1, 2), Nsamp = list(100, 100), years =
##D   list(1938:2012, seq(1974, 2012, by = 2)), agebin_vector = NULL, cpar =
##D   c(1, 1))
##D 
##D E0 <- list(natM_type = "1Parm", natM_n_breakpoints = NULL, natM_lorenzen =
##D   NULL, natM_val = c(NA,-1), par_name = "LnQ_base_3_CPUE", par_int = NA,
##D   par_phase = -1, forecast_num = 0)
##D 
##D M0 <- list(NatM_p_1_Fem_GP_1 = rep(0, 100))
##D 
##D ss3sim_base(iterations = 1, scenarios = "D1-E0-F0-M0-cod",
##D   f_params = F0, index_params = index1, lcomp_params = lcomp1,
##D   agecomp_params = agecomp1, estim_params = E0, tv_params = M0,
##D   om_dir = om, em_dir = em)
##D 
##D unlink("D1-E0-F0-M0-cod", recursive = TRUE) # clean up
##D 
##D setwd(wd)
## End(Not run)



