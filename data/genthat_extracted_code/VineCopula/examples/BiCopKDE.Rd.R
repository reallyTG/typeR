library(VineCopula)


### Name: BiCopKDE
### Title: Kernel estimate of a Bivariate Copula Density
### Aliases: BiCopKDE

### ** Examples

# simulate data from Joe copula
cop <- BiCop(3, tau = 0.3)
u <- BiCopSim(1000, cop)
contour(cop)  # true contours

# kernel contours with standard normal margins
BiCopKDE(u[, 1], u[, 2])
BiCopKDE(u[, 1], u[, 2], kde.pars = list(mult = 0.5))  # undersmooth
BiCopKDE(u[, 1], u[, 2], kde.pars = list(mult = 2))  # oversmooth

# kernel density with uniform margins
BiCopKDE(u[, 1], u[, 2], type = "surface", zlim = c(0, 4))
plot(cop, zlim = c(0, 4))  # true density

# kernel contours are also used in pairs.copuladata
## No test: 
data(daxreturns)
data <- as.copuladata(daxreturns)
pairs(data[c(4, 5, 14, 15)])
## End(No test)




