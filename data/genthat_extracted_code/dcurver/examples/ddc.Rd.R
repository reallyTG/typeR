library(dcurver)


### Name: ddc
### Title: Density function for univariate Davidian curves
### Aliases: ddc

### ** Examples

curve(ddc(x, 1.570789), -6, 6) # Approximately normal.

phi <- c(77.32, 78.51, 76.33, 77.16)
curve(ddc(x, phi), -6, 6) # A bimodal density.
integrate(ddc, phi = phi, lower = -Inf, upper = Inf) # Integrates to 1.



