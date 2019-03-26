library(EBASS)


### Name: create_object_evpi_decrease
### Title: Create an object evpi_decrease
### Aliases: create_object_evpi_decrease

### ** Examples

## First, create 3 objects : inmb, pop and var_inmb, then create the evpi_decrease object
object_lambda <- create_object_lambda (20000)
object_inmb <- create_object_inmb(de = 0.04, dc=-168, object_lambda = object_lambda)
object_var_inmb <- create_object_var_inmb(sde=0.12, sdc=2100, rho=0.1, object_lambda=object_lambda)
object_pop <- create_object_pop(horizon = 20, discount=0.04, N_year = 52000)
object_evpi_decrease <- create_object_evpi_decrease(object_inmb, object_pop, object_var_inmb)



