library(rockchalk)


### Name: lazyCov
### Title: Create covariance matrix from correlation and standard deviation
###   information
### Aliases: lazyCov

### ** Examples

##correlation 0.8 for all pairs, standard deviation 1.0 of each
lazyCov(Rho = 0.8, Sd = 1.0, d = 3)
## supply a vech (lower triangular values in a column)
lazyCov(Rho = c(0.1, 0.2, 0.3), Sd = 1.0)
## supply vech with different standard deviations
lazyCov(Rho = c(0.1, 0.2, 0.3), Sd = c(1.0, 2.2, 3.3))
newRho <- lazyCor(c(0.5, 0.6, 0.7, -0.1, 0.1, 0.2))
lazyCov(Rho = newRho, Sd = 1.0)
lazyCov(Rho = newRho, Sd = c(3, 4, 5, 6))



