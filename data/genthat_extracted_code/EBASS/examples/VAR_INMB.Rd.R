library(EBASS)


### Name: VAR_INMB
### Title: A Reference Class to represent the Hypothetical variance of the
###   Incremental Net Monetary Benefit
### Aliases: VAR_INMB

### ** Examples

## First, create a lambda object
object_lambda <- create_object_lambda (20000)
## Then, create a var_inmb object
var_inmb <- create_object_var_inmb(sde=0.12, sdc=2100, rho=0.1, object_lambda=object_lambda)
var_inmb$get_var_inmb()



