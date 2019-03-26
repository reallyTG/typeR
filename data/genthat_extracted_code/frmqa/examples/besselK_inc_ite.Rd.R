library(frmqa)


### Name: besselK_inc_ite
### Title: Approximation of the Incomplete BesselK Function Iteratively
### Aliases: besselK_inc_ite

### ** Examples

## "Exact" evaluation are given by Maple 15
options(digits = 16)

## Gives accurate approximations
## x = 0.01, y = 4, lambda = 0, exact value = 2.225 310 761 266 4692
besselK_inc_ite(0.01, 4, 0, traceIBF = FALSE, epsilon = 0.95, nmax = 160)
## x = 1, y = 4, lambda = 2, exact value = 0.006 101 836 926 254 8540
besselK_inc_ite(1, 4, 2, traceIBF = FALSE, epsilon = 0.95, nmax = 160)

## NaN occurs
## x = 1, y = 1.5, lambda = 8, exact value = 0.010 515 920 838 551 3164
## Not run: 
##D besselK_inc_ite(1, 1.5, 8, traceIBF = TRUE, epsilon = 0.95, 
##D   nmax = 180)
## End(Not run)

##Loss of accuracy
## x = 14.5, y = 19, lambda = 0, exact value = 9.556 185 644 444 739 5139(-16)
besselK_inc_ite(14.75, 19, 2, traceIBF = TRUE, epsilon = 0.95, nmax = 160)
## x = 17, y = 15, lambda = 1, exact value= 1.917 488 390 220 793 6555(-15)
besselK_inc_ite(17, 15, 1, traceIBF = TRUE, epsilon = 0.95, nmax = 160)



