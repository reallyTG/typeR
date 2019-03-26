library(GPoM)


### Name: numinoisy
### Title: Generates time series of deterministic-behavior with stochatic
###   perturbations (measurement and/or dynamical noise)
### Aliases: numinoisy

### ** Examples

#############
# Example 1 #
#############
# Rossler Model formulation
# The model dimension
nVar = 3
 # maximal polynomial degree
dMax = 2
a = 0.520
b = 2
c = 4
Eq1 <- c(0,-1, 0,-1, 0, 0, 0, 0, 0, 0)
Eq2 <- c(0, 0, 0, a, 0, 0, 1, 0, 0, 0)
Eq3 <- c(b,-c, 0, 0, 0, 0, 0, 1, 0, 0)
K <- cbind(Eq1, Eq2, Eq3)
# Edit the equations
visuEq(nVar, dMax, K)
# initial conditions
v0 <- c(-0.6, 0.6, 0.4)
# output time required
timeOut = (0:1000)/50
# variance of additive noise
varBruitA = c(0,0,0)^2
# variance of multiplitive noise
varBruitM = c(2E-2, 0, 2E-2)^2
# numerical integration with noise
intgr <- numinoisy(v0, timeOut, K, varBruitA = varBruitA, varBruitM = varBruitM, freq = 1)
# Plot of the simulated time series obtained
dev.new()
plot(intgr$donnees[,2], intgr$donnees[,3], type='l',
      main='phase portrait', xlab='x(t)', ylab = 'y(t)')
dev.new()
par(mfrow = c(3, 1))
plot(intgr$donnees[,1], intgr$donnees[,2], type='l',
      main='phase portrait', xlab='x(t)', ylab = 'y(t)')
lines(intgr$donnees[,1], intgr$vectBruitM[,2]*10, type='l',
      main='phase portrait', xlab='x(t)', ylab = 'e(t)*10', col='red')
plot(intgr$donnees[,1], intgr$donnees[,3], type='l',
      main='phase portrait', xlab='x(t)', ylab = 'y(t)')
lines(intgr$donnees[,1], intgr$vectBruitM[,3]*10, type='l',
      main='phase portrait', xlab='x(t)', ylab = 'e(t)*10', col='red')
plot(intgr$donnees[,1], intgr$donnees[,4], type='l',
      main='phase portrait', xlab='x(t)', ylab = 'y(t)')
lines(intgr$donnees[,1], intgr$vectBruitM[,4]*10, type='l',
      main='phase portrait', xlab='x(t)', ylab = 'e(t)*10', col='red')




