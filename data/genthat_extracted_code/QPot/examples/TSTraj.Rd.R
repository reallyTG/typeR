library(QPot)


### Name: TSTraj
### Title: Simulate two-dimensional stochastic differential equations
### Aliases: TSTraj
### Keywords: Stochastic simulation

### ** Examples

# First, the parameter values
model.state <- c(x = 3, y = 3)
model.sigma <- 0.2
model.deltat <- 0.1
model.time <- 100

# Second, write out the deterministic skeleton of the equations to be simulated
equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0 + x*x)"
equationy <- "((0.476*x*x*y)/(1 + x*x)) - 0.112590*y*y"

# Third, Run it
ModelOut <- TSTraj(y0 = model.state, time = model.time, deltat = model.deltat, 
	x.rhs = equationx, y.rhs = equationy, sigma = model.sigma)

# Can also input x.rhs and y.rhs as strings that contain parameter names 
# and include parms with names and values of parameters
model.state <- c(x = 1, y = 2)
model.parms <- c(alpha = 1.54, beta = 10.14, delta = 1, kappa = 1, gamma = 0.476, mu = 0.112509)
model.sigma <- 0.2
model.time <- 100
model.deltat <- 0.1

test.eqn.x = "(alpha*x)*(1-(x/beta)) - ((delta*(x^2)*y)/(kappa + (x^2)))"
test.eqn.y = "((gamma*(x^2)*y)/(kappa + (x^2))) - mu*(y^2)"

ModelOut.parms <- TSTraj(y0 = model.state, time = model.time, deltat = model.deltat, 
	x.rhs = test.eqn.x, y.rhs = test.eqn.y, parms = model.parms, sigma = model.sigma)



