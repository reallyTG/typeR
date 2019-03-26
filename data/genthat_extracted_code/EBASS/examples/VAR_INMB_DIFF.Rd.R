library(EBASS)


### Name: VAR_INMB_DIFF
### Title: A Reference Class to represent the variance of the Incremental
###   Net Monetary Benefit (INMB) when the standard deviation of costs and
###   effectiveness in each group differ.
### Aliases: VAR_INMB_DIFF

### ** Examples

## First, create a lambda object
object_lambda <- create_object_lambda (20000)
## Then, create a var_inmb_diff object
var_inmb_diff <- create_object_var_inmb_diff(sdc_ref=2100, sdc_exp=2100, sde_ref = 0.12,
sde_exp = 0.12, rho = 0.1,object_lambda = object_lambda)



