library(valuer)


### Name: va_pde_pricer
### Title: PDE Pricing of Variable Annuity
### Aliases: va_pde_pricer

### ** Examples

lambda <- function(t) mu(t, x = 50, c1 = 90.43 , c2 = 10.36)
K <- function(t, T) {0.05 * ( 1 - t / T)^3}

va <- va_pde_pricer(lambda = lambda, K = K, Fmax = 200)

va



