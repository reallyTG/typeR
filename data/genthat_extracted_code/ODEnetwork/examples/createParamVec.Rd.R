library(ODEnetwork)


### Name: createParamVec
### Title: Creates Parameter Vector
### Aliases: createParamVec

### ** Examples

if (interactive()) {
  masses <- c(1, 2)
  dampers <- diag(c(0.1, 0.5))
  dampers[1, 2] <- 0.05
  springs <- diag(c(4, 10))
  springs[1, 2] <- 6
  odenet <- ODEnetwork(masses, dampers, springs)
  createParamVec(odenet)
}



