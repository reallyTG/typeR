library(gbutils)


### Name: sim_numbers
### Title: Simulation based on polar form specifications
### Aliases: sim_numbers
### Keywords: distribution simulation

### ** Examples

## one real number and one complex conjugated pair
## (maybe to specify a cubic polynomial through its roots)
sim_numbers(type = c("r", "cp"))

## here the real value is fixed to have modulus 1, leaving the sign unspecified
sim_numbers(type = c("r", "cp"), abs = c(1, NA))

## now the real value is fixed to 1,
##     the complex pair has argument  +-pi/2, and free modulus:
sim_numbers(type = c("r", "cp"), abs = c(1, NA), sign = c(0, pi/2))


## using argument 'values' to fix some values;
## here the the third value is fixed:
sim_numbers(type = c("r", "cp", "r"), values = c(NA,NA,3))  # type[3] = "r"
sim_numbers(type = c("r", "cp", "cp"), values = c(NA,NA,3i)) # type[3] = "cp"

## type[3] can be left NA since it can be inferred from values[3]:
sim_numbers(type = c("r", "cp", NA), values = c(NA,NA,3))  # type[3] = "r"
sim_numbers(type = c("r", "cp", NA), values = c(NA,NA,3i)) # type[3] = "cp"

## it is an error to have a mismatch between args `type' and value:
## Not run: 
##D sim_numbers(type = c("r", "cp", "cp"), values = c(NA,NA,3))
##D sim_numbers(type = c("r", "cp", "r"), values = c(NA,NA,3i))
## End(Not run)

## simulate 10 reals with the default generators
sim_numbers(rep("r", 10))

## simulate modulus from Rayleigh distribution
##
rR <- function(n, sigma = 1) sigma * sqrt(-2*log(runif(n)))
sim_numbers(type = c("cp", "cp"), absgen = rR, absarg = list())

# test the the components are N(0,1)
## (not run to save time for CRAN check)
## \dontrun{
## v <- sim_numbers(type = rep("cp", 10000), absgen = "rR",
##                  absarg = list(sigma = 1))
## ks.test(Re(v$values), "pnorm")
## ks.test(Im(v$values), "pnorm")
## }



