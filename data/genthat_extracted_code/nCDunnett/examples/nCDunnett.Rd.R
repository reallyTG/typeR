library(nCDunnett)


### Name: nCDunnett
### Title: Noncentral Dunnett's test distribution
### Aliases: dNCDun pNCDun qNCDun rNCDun
### Keywords: Dunnett

### ** Examples

library(nCDunnett)
n <- 50
nu <- 9
rho <- c(0.5,0.5,0.5)
delta <- c(0,0,0)
x <- rNCDun(n, nu, rho, delta)
hist(x)
q <- 2.30
p <- 0.95
prob <- length(x[x<=q])/n
prob
pNCDun(q, nu, rho, delta, 32, TRUE)
dNCDun(q, nu, rho, delta, 32, TRUE)
qNCDun(p, nu, rho, delta, 16, TRUE)

q     <- c(2.34, 4.50, 3.40)
p     <- c(0.85, 0.95, 0.975)
nu    <- c(Inf, 19, 15)
# unbalanced example
rho   <- c(0.23, 0.25, 0.27)
delta <- c(0, 0, 0) # central case
pNCDun(q, nu, rho, delta, 32, TRUE)
dNCDun(q, nu, rho, delta, 32, TRUE)
qNCDun(p, nu, rho, delta, 16, TRUE)



