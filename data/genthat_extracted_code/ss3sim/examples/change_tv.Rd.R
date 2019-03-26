library(ss3sim)


### Name: change_tv
### Title: Methods to include time-varying parameters in an SS3 operating
###   model
### Aliases: change_tv

### ** Examples

## Not run: 
##D # Create a temporary folder for the output and set the working directory:
##D temp_path <- file.path(tempdir(), "ss3sim-tv-example")
##D dir.create(temp_path, showWarnings = FALSE)
##D wd <- getwd()
##D setwd(temp_path)
##D 
##D # Find the SS3 "Simple" model in the package data:
##D d <- system.file("extdata", package = "ss3sim")
##D simple <- paste0(d, "/Simple")
##D dir.create("Simple")
##D file.copy(simple, ".", recursive = TRUE)
##D setwd("Simple")
##D 
##D # Run SS3 to create control.ss_new and Report.sso:
##D system("ss3_24o_safe starter.ss -noest")
##D 
##D change_tv(change_tv_list = list("NatM_p_1_Fem_GP_1" = c(rep(0, 20),
##D       rep(.1, 11)), "SR_BH_steep"=rnorm(31, 0, 0.05)), ctl_file_in =
##D   "control.ss_new", ctl_file_out = "example.ctl", dat_file_in =
##D   "simple.dat", dat_file_out = "example.dat")
##D 
##D # Clean up:
##D setwd("../")
##D unlink("Simple")
##D setwd(wd)
## End(Not run)



