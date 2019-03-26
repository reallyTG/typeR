library(exuber)


### Name: wb_cv
### Title: Wild Bootstrap Critical values
### Aliases: wb_cv

### ** Examples

## No test: 
# Simulate bubble processes
dta <- cbind(sim_dgp1(n = 100), sim_dgp2(n = 100))

# Default minimum window
wb <- wb_cv(y = dta)

# Change the minimum window and the number of bootstraps
wb <- wb_cv(y = dta, nboot = 1500,  minw = 20)

# Use parallel computing (utilizing all available cores)
wb <- wb_cv(y = dta, parallel = TRUE)
## End(No test)



