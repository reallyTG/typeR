library(gmvarkit)


### Name: get_boldA_eigens
### Title: Calculate absolute values of the eigenvalues of the "bold A"
###   matrices containing the AR coefficients
### Aliases: get_boldA_eigens

### ** Examples

params222 <- c(-11.904, 154.684, 1.314, 0.145, 0.094, 1.292, -0.389,
 -0.070, -0.109, -0.281, 0.920, -0.025, 4.839, 11.633, 124.983, 1.248,
  0.077, -0.040, 1.266, -0.272, -0.074, 0.034, -0.313, 5.855, 3.570,
  9.838, 0.740)
mod222 <- GMVAR(d=2, p=2, M=2, params=params222, parametrization="mean")
get_boldA_eigens(mod222)



