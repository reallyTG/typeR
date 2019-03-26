library(QPot)


### Name: Model2String
### Title: Inserts parameter values into equations
### Aliases: Model2String

### ** Examples

# First example with the right hand side of an equation
test.eqn.x = "(alpha*x)*(1-(x/beta)) - ((delta*(x^2)*y)/(kappa + (x^2)))"
model.parms <- c(alpha=1.54, beta=10.14, delta=1, kappa=1)
equations.as.strings.x <- Model2String(test.eqn.x, parms = model.parms)

# Second example with individual strings with left and right hand sides
# Note the use deSolve.form = TRUE to remove the dx and dy
test.eqn.x = "dx = (alpha*x)*(1-(x/beta)) - ((delta*(x^2)*y)/(kappa + (x^2)))"
test.eqn.y = "dy = ((gamma*(x^2)*y)/(kappa + (x^2))) - mu*(y^2)"
model.parms <- c(alpha=1.54, beta=10.14, delta=1, kappa=1, gamma=0.476, mu=0.112509)
equations.as.strings.x <- Model2String(test.eqn.x, parms = model.parms, 
 deSolve.form = TRUE, x.lhs.term = 'dx', y.lhs.term = 'dy')
equations.as.strings.y <- Model2String(test.eqn.y, parms = model.parms, 
 deSolve.form = TRUE, x.lhs.term = 'dx', y.lhs.term = 'dy')

# Third example with deSolve-style function call:
model.parms <- c(alpha=1.54, beta=10.14, delta=1, kappa=1, gamma=0.476, mu=0.112509)
ModelEquations <- function(t, state, parms) {
	with(as.list(c(state, parms)), {
dx <- (alpha*x)*(1-(x/beta)) - ((delta*(x^2)*y)/(kappa + (x^2)))
dy <- ((gamma*(x^2)*y)/(kappa + (x^2))) - mu*(y^2)
list(c(dx,dy))
})
}

Model2String(ModelEquations, parms = model.parms, deSolve.form = TRUE, 
 x.lhs.term = 'dx', y.lhs.term = 'dy') 



