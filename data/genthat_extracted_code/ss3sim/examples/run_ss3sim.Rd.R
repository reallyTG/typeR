library(ss3sim)


### Name: run_ss3sim
### Title: Master function to run SS3 simulations
### Aliases: run_ss3sim

### ** Examples

## Not run: 
##D # Create a temporary folder for the output and set the working directory:
##D temp_path <- file.path(tempdir(), "ss3sim-example")
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
##D # Without bias adjustment:
##D run_ss3sim(iterations = 1, scenarios = "D0-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em)
##D unlink("D0-F0-cod", recursive = TRUE) # clean up
##D 
##D # An example specifying the case files:
##D run_ss3sim(iterations = 1, scenarios = "D0-F0-E0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   case_files = list(F = "F", D = c("index", "lcomp",
##D       "agecomp"), E = "E"))
##D unlink("D0-F0-cod", recursive = TRUE) # clean up
##D 
##D # With bias adjustment:
##D # (Note that bias_nsim should be bigger, say 5 or 10, but it is set
##D # to 2 here so the example runs faster.)
##D run_ss3sim(iterations = 1, scenarios = "D1-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   bias_adjust = TRUE, bias_nsim = 2)
##D 
##D # Restarting the previous run using the existing bias-adjustment
##D # output
##D run_ss3sim(iterations = 2:3, scenarios = "D1-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   bias_adjust = FALSE, bias_already_run = TRUE)
##D unlink("D1-F0-cod", recursive = TRUE)
##D 
##D # A run with deterministic process error for model checking:
##D recdevs_det <- matrix(0, nrow = 100, ncol = 20)
##D run_ss3sim(iterations = 1:20, scenarios = "D0-E100-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   bias_adjust = TRUE, bias_nsim = 2, user_recdevs = recdevs_det)
##D unlink("D0-E100-F0-cod", recursive = TRUE)
##D 
##D # An example of a run using parallel processing across 2 cores:
##D require(doParallel)
##D registerDoParallel(cores = 2)
##D require(foreach)
##D getDoParWorkers() # check how many cores are registered
##D 
##D # parallel scenarios:
##D run_ss3sim(iterations = 1, scenarios = c("D0-F0-cod",
##D     "D1-F0-cod"), case_folder = case_folder,
##D   om_dir = om, em_dir = em, parallel = TRUE)
##D unlink("D0-F0-cod", recursive = TRUE)
##D unlink("D1-F0-cod", recursive = TRUE)
##D 
##D # parallel iterations:
##D run_ss3sim(iterations = 1:2, scenarios = c("D0-F0-cod"),
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   parallel = TRUE, parallel_iterations = TRUE)
##D unlink("D0-F0-cod", recursive = TRUE)
##D 
##D # parallel iterations with bias adjustment:
##D run_ss3sim(iterations = 1:2, scenarios = c("D0-F0-cod"),
##D   case_folder = case_folder, om_dir = om, em_dir = em, parallel = TRUE,
##D   parallel_iterations = TRUE, bias_adjust = TRUE, bias_nsim = 2)
##D unlink("D0-F0-cod", recursive = TRUE)
##D 
##D # Return to original working directory:
##D setwd(wd)
## End(Not run)



