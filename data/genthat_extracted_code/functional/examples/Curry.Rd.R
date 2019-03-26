library(functional)


### Name: Curry
### Title: Pre-specify a procedures named parameters, returning a new
###   procedure.
### Aliases: Curry

### ** Examples

double <- Curry(`*`, e1=2)
stopifnot(double(4) == 8)



