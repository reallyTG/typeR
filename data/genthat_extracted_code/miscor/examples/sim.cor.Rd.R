library(miscor)


### Name: sim.cor
### Title: Simulate bivariate distribution with a specified correlation
### Aliases: sim.cor

### ** Examples

#------------------------------------------------
# Bivariate  distribution with rho = 0.3, n = 200
# x: skewness = 0, kurtosis = 0
# y: skewness = 0, kurtosis = 0

sim.cor(200, rho = 0.3)

#-----------------------------------------------
# Bivariate distribution with rho = 0.4, n = 500
# x: skewness = 0, kurtosis = 1.5
# y: skewness = 2, kurtosis = 7

sim.cor(500, rho = 0.4, skewness = c(0, 1.5), kurtosis = c(2, 7))



