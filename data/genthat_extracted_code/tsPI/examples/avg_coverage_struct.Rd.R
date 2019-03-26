library(tsPI)


### Name: avg_coverage_struct
### Title: Compute the average coverage of the prediction intervals
###   computed by 'struct_pi' and plug-in method
### Aliases: avg_coverage_struct

### ** Examples

## Not run: 
##D set.seed(123)
##D # takes a while, notice se, increase nsim2 to get more accurate results
##D avg_coverage_struct(type = "level", sds = c(1, 0.1), n = 50, n_ahead = 10, nsim2 = 100)
##D avg_coverage_struct(type = "BSM", sds = c(1, 1, 0.1, 10),
##D  frequency = 4, n = 50, n_ahead = 10, nsim2 = 100)
## End(Not run)



