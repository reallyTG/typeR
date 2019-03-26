library(GPoM)


### Name: numicano
### Title: Numerical Integration of models in ODE of polynomial form
### Aliases: numicano

### ** Examples

#############
# Example 1 #
#############
# For a model of general form (here the rossler model)
# model dimension:
nVar = 3
# maximal polynomial degree
dMax = 2
# Number of parameter number (by default)
pMax <- d2pMax(nVar, dMax)
# convention used for the model formulation
poLabs(nVar, dMax)
# Definition of the Model Function
a = 0.520
b = 2
c = 4
Eq1 <- c(0,-1, 0,-1, 0, 0, 0, 0, 0, 0)
Eq2 <- c(0, 0, 0, a, 0, 0, 1, 0, 0, 0)
Eq3 <- c(b,-c, 0, 0, 0, 0, 0, 1, 0, 0)
K <- cbind(Eq1, Eq2, Eq3)
# Edition of the equations
visuEq(nVar, dMax, K)
# initial conditions
v0 <- c(-0.6, 0.6, 0.4)
# model integration
reconstr <- numicano(nVar, dMax, Istep=1000, onestep=1/50, KL=K,
                      v0=v0, method="ode45")
# Plot of the simulated time series obtained
dev.new()
plot(reconstr$reconstr[,2], reconstr$reconstr[,3], type='l',
      main='phase portrait', xlab='x(t)', ylab = 'y(t)')

## Not run: 
##D #############
##D # Example 2 #
##D #############
##D # For a model of canonical form
##D # model dimension:
##D nVar = 4
##D # maximal polynomial degree
##D dMax = 3
##D # Number of parameter number (by default)
##D pMax <- d2pMax(nVar, dMax)
##D # Definition of the Model Function
##D PolyTerms <- c(281000, 0, 0, 0, -2275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
##D                861, 0, 0, 0, -878300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
##D # terms used in the model
##D poLabs(nVar, dMax, PolyTerms!=0)
##D # initial conditions
##D v0 <- c(0.54, 3.76, -90, -5200)
##D # model integration
##D reconstr <- numicano(nVar, dMax, Istep=500, onestep=1/250, PolyTerms=PolyTerms,
##D                      v0=v0, method="ode45")
##D # Plot of the simulated time series obtained
##D plot(reconstr$reconstr[,2], reconstr$reconstr[,3], type='l',
##D      main='phase portrait', xlab='x', ylab = 'dx/dt')
##D # Edition of the equations
##D visuEq(nVar, dMax, reconstr$KL)
## End(Not run)




