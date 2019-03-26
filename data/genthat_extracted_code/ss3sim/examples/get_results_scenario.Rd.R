library(ss3sim)


### Name: get_results_scenario
### Title: Extract SS3 simulation results for one scenario.
### Aliases: get_results_scenario

### ** Examples

## Not run: 
##D d <- system.file("extdata", package = "ss3sim")
##D case_folder <- paste0(d, "/eg-cases")
##D om <- paste0(d, "/models/cod-om")
##D em <- paste0(d, "/models/cod-em")
##D run_ss3sim(iterations = 1:2, scenarios =
##D   c("D0-F0-G0-S0-cod"),
##D   case_folder = case_folder, om_dir = om, em_dir = em,
##D   bias_adjust = FALSE)
##D get_results_scenario(c("D0-F0-G0-S0-cod"))
## End(Not run)



