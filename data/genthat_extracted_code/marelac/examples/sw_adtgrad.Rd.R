library(marelac)


### Name: sw_adtgrad
### Title: Adiabatic Temperature Gradient in Seawater
### Aliases: sw_adtgrad
### Keywords: utilities

### ** Examples

sw_adtgrad(t = 40, S = 40, p = 1000)  #3.255976e-4

## Check values
sw_adtgrad(S = 25, t = 10, p = 0)    # 0.1002e-3
sw_adtgrad(S = 25, t = 10, p = 100)  # 0.1135e-3
sw_adtgrad(S = 25, t = 10, p = 1000) # 0.2069e-3

sw_adtgrad(S = 25, t = 30, p = 0)    # 0.2417e-3
sw_adtgrad(S = 40, t = 30, p = 0)    # 0.2510e-3
sw_adtgrad(S = 40, t = 0,  p = 100)  # 0.0630e-3




