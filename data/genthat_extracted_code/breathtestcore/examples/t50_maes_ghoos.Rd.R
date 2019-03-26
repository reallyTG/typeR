library(breathtestcore)


### Name: t50_maes_ghoos
### Title: Half-emptying time by Maes/Ghoos method
### Aliases: t50_maes_ghoos

### ** Examples

# Integral from 0 to infinity is 100 at dose 100 mg
integrate(exp_beta, 0, Inf, beta = 1.5, k = 0.01, m = 1, dose = 100)
t50_mg = t50_maes_ghoos(c(beta = 1.5, k = 0.01, dose = 100))
t50_mg
# Integral to half-emptying time \code{t50_maes_ghoos} is 50 
integrate(exp_beta, 0, t50_mg, beta = 1.5, k = 0.01, m = 1, dose = 100)



