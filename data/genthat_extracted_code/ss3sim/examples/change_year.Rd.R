library(ss3sim)


### Name: change_year
### Title: Methods to change the years in an ss3sim model
### Aliases: change_year

### ** Examples

## Not run: 
##D # Create a temporary folder for the output and set the working directory:
##D wd.old <- getwd()
##D temp_path <- file.path(tempdir(), "change_year-example")
##D dir.create(temp_path, showWarnings = FALSE)
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
##D system("SS3_24o_safe starter.ss -noest")
##D 
##D change_year(year_begin = 1, year_end = 100, burnin = 25,
##D  ctl_file_in = "control.ss_new", ctl_file_out = "change_year.ctl",
##D  dat_file_in = "simple.dat", dat_file_out = "change_year.dat",
##D  par_file_in = "ss3.par", par_file_out = "change_year.par",
##D  str_file_in = "starter.ss", str_file_out = "change_year_starter.ss",
##D  for_file_in = "forecast.ss", for_file_out = "change_year_forecast.ss")
##D 
##D # Clean up:
##D setwd("../")
##D unlink("Simple")
##D setwd(wd.old)
## End(Not run)



