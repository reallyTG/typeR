library(ss3sim)


### Name: run_bias_ss3
### Title: Determine level of bias adjustment for SS3 runs
### Aliases: run_bias_ss3

### ** Examples

## Not run: 
##D # Create a temporary folder for the output:
##D temp_path <- file.path(tempdir(), "ss3sim-bias-example")
##D dir.create(temp_path, showWarnings = FALSE)
##D 
##D d <- system.file("extdata", package = "ss3sim")
##D case_folder <- paste0(d, "/eg-cases")
##D om <- paste0(d, "/models/cod-om")
##D em <- paste0(d, "/models/cod-em")
##D wd <- getwd()
##D setwd(temp_path)
##D # (Note that bias_nsim should be bigger, say 10, but it is set to 2
##D # here so the example runs faster.)
##D run_ss3sim(iterations = 1:1, scenarios = "D1-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   bias_adjust = TRUE, bias_nsim = 2)
##D setwd(wd)
## End(Not run)



