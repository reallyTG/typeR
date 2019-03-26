library(sde)


### Name: sde.sim
### Title: Simulation of stochastic differential equation
### Aliases: sde.sim
### Keywords: datagen ts

### ** Examples

# Ornstein-Uhlenbeck process
set.seed(123)
d <- expression(-5 * x)
s <- expression(3.5) 
sde.sim(X0=10,drift=d, sigma=s) -> X
plot(X,main="Ornstein-Uhlenbeck")

# Multiple trajectories of the O-U process
set.seed(123)
sde.sim(X0=10,drift=d, sigma=s, M=3) -> X
plot(X,main="Multiple trajectories of O-U")

# Cox-Ingersoll-Ross process
# dXt = (6-3*Xt)*dt + 2*sqrt(Xt)*dWt
set.seed(123)
d <- expression( 6-3*x ) 
s <- expression( 2*sqrt(x) ) 
sde.sim(X0=10,drift=d, sigma=s) -> X
plot(X,main="Cox-Ingersoll-Ross")

# Cox-Ingersoll-Ross using the conditional distribution "rcCIR"

set.seed(123)
sde.sim(X0=10, theta=c(6, 3, 2), rcdist=rcCIR, 
        method="cdist") -> X
plot(X, main="Cox-Ingersoll-Ross")

set.seed(123)
sde.sim(X0=10, theta=c(6, 3, 2), model="CIR") -> X
plot(X, main="Cox-Ingersoll-Ross")

# Exact simulation
set.seed(123)
d <- expression(sin(x))
d.x <- expression(cos(x)) 
A <- function(x) 1-cos(x)
sde.sim(method="EA", delta=1/20, X0=0, N=500, 
        drift=d, drift.x = d.x, A=A) -> X
plot(X, main="Periodic drift")



