library(gbutils)


### Name: sim_complex
### Title: Simulate real or complex numbers using polar form
### Aliases: sim_complex sim_real
### Keywords: distribution simulation

### ** Examples

## x[1] is fixed to 1, x[2] is negative with random magnitude:
x <- sim_real(c(1,NA,NA,NA), c(1, -1, NA, NA))

## z[1] fixed to 1, the remaining elements of z
## have random magnitude and fixed arguments:
z <- sim_complex(c(1,NA,NA,NA), c(0, pi/2, pi, -pi/2))

## without restrictions
sim_complex(rep(NA,4))
sim_real(rep(NA,4))

## moduli unrestricted; arguments restricted
sim_complex(rep(NA,4), c(0, pi/2, pi, -pi/2))



