library(nloptr)


### Name: auglag
### Title: Augmented Lagrangian Algorithm
### Aliases: auglag

### ** Examples


x0 <- c(1, 1)
fn <- function(x) (x[1]-2)^2 + (x[2]-1)^2
hin <- function(x) -0.25*x[1]^2 - x[2]^2 + 1    # hin >= 0
heq <- function(x) x[1] - 2*x[2] + 1            # heq == 0
gr <- function(x) nl.grad(x, fn)
hinjac <- function(x) nl.jacobian(x, hin)
heqjac <- function(x) nl.jacobian(x, heq)

auglag(x0, fn, gr = NULL, hin = hin, heq = heq) # with COBYLA
# $par:     0.8228761 0.9114382
# $value:   1.393464
# $iter:    1001

auglag(x0, fn, gr = NULL, hin = hin, heq = heq, localsolver = "SLSQP")
# $par:     0.8228757 0.9114378
# $value:   1.393465
# $iter     173

##  Example from the alabama::auglag help page
fn <- function(x) (x[1] + 3*x[2] + x[3])^2 + 4 * (x[1] - x[2])^2
heq <- function(x) x[1] + x[2] + x[3] - 1
hin <- function(x) c(6*x[2] + 4*x[3] - x[1]^3 - 3, x[1], x[2], x[3])

auglag(runif(3), fn, hin = hin, heq = heq, localsolver="lbfgs")
# $par:     2.380000e-09 1.086082e-14 1.000000e+00
# $value:   1
# $iter:    289

##  Powell problem from the Rsolnp::solnp help page
x0 <- c(-2, 2, 2, -1, -1)
fn1  <- function(x) exp(x[1]*x[2]*x[3]*x[4]*x[5])
eqn1 <-function(x)
	c(x[1]*x[1]+x[2]*x[2]+x[3]*x[3]+x[4]*x[4]+x[5]*x[5],
	  x[2]*x[3]-5*x[4]*x[5],
	  x[1]*x[1]*x[1]+x[2]*x[2]*x[2])

auglag(x0, fn1, heq = eqn1, localsolver = "mma")
# $par: -3.988458e-10 -1.654201e-08 -3.752028e-10  8.904445e-10  8.926336e-10
# $value:   1
# $iter:    1001




