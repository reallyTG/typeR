library(ss3sim)


### Name: calculate_re
### Title: Calculate relative error
### Aliases: calculate_re

### ** Examples

# Example with built in package data:
d1 <- system.file("extdata", "output", "ss3sim_ts.csv",
  package = "ss3sim")
d2 <- system.file("extdata", "output", "ss3sim_scalar.csv",
  package = "ss3sim")
ss3sim_ts <- read.csv(d1)
ss3sim_scalar <- read.csv(d2)

head(calculate_re(ss3sim_ts))
head(calculate_re(ss3sim_ts, add = FALSE))
head(calculate_re(ss3sim_scalar, add = FALSE))

## Not run: 
##D # Full example:
##D d <- system.file("extdata", package = "ss3sim")
##D om <- paste0(d, "/models/cod-om")
##D em <- paste0(d, "/models/cod-em")
##D case_folder <- paste0(d, "/eg-cases")
##D 
##D run_ss3sim(iterations = 1, scenarios = "D0-F0-cod",
##D   case_folder = case_folder, om_dir = om, em_dir = em, ss_mode = "optimized")
##D 
##D get_results_all(user_scenarios = "D0-F0-cod")
##D ss3sim_ts <- read.csv("ss3sim_ts.csv")
##D ss3sim_scalar <- read.csv("ss3sim_scalar.csv")
##D 
##D head(calculate_re(ss3sim_ts))
##D head(calculate_re(ss3sim_scalar, add = FALSE))
##D 
##D # clean up:
##D unlink("D0-F0-cod", recursive = TRUE)
##D unlink("ss3sim_ts.csv", recursive = TRUE)
##D unlink("ss3sim_scalar.csv", recursive = TRUE)
## End(Not run)



