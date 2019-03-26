library(medicalrisk)


### Name: sessler_get_single_beta
### Title: Returns the covariate coefficient for a particular diagnosis or
###   procedure code, along with the actual code that was found in the
###   internal database of coefficients. If a child code is supplied but
###   its parent is in the database, the coefficient for the parent will be
###   returned, along with that parent code. For example, if D1231 is
###   supplied but only D123 is available, D123 will be used. This is
###   apparently how the SPSS sample code works.
### Aliases: sessler_get_single_beta

### ** Examples

# get coefficient for hypercholesterolemia
sessler_get_single_beta('D2720', rsi_beta_inhosp)
# Also works with extra 0 on the end
sessler_get_single_beta('D27200', rsi_beta_inhosp)



