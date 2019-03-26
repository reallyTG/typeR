library(actuar)


### Name: ruin
### Title: Probability of Ruin
### Aliases: ruin plot.ruin
### Keywords: models

### ** Examples

## Case with an explicit formula: exponential claims and exponential
## interarrival times.
psi <- ruin(claims = "e", par.claims = list(rate = 5),
            wait   = "e", par.wait   = list(rate = 3))
psi
psi(0:10)
plot(psi, from = 0, to = 10)

## Mixture of two exponentials for claims, exponential interarrival
## times (Gerber 1979)
psi <- ruin(claims = "e", par.claims = list(rate = c(3, 7), w = 0.5),
            wait   = "e", par.wait   = list(rate = 3), pre = 1)
u <- 0:10
psi(u)
(24 * exp(-u) + exp(-6 * u))/35	# same

## Phase-type claims, exponential interarrival times (Asmussen and
## Rolski 1991)
p <- c(0.5614, 0.4386)
r <- matrix(c(-8.64, 0.101, 1.997, -1.095), 2, 2)
lambda <- 1/(1.1 * mphtype(1, p, r))
psi <- ruin(claims = "p", par.claims = list(prob = p, rates = r),
            wait   = "e", par.wait   = list(rate = lambda))
psi
plot(psi, xlim = c(0, 50))

## Phase-type claims, mixture of two exponentials for interarrival times
## (Asmussen and Rolski 1991)
a <- (0.4/5 + 0.6) * lambda
ruin(claims = "p", par.claims = list(prob = p, rates = r),
     wait   = "e", par.wait   = list(rate = c(5 * a, a), weights =
                                     c(0.4, 0.6)),
     maxit = 225L)



