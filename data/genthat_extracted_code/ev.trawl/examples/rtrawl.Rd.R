library(ev.trawl)


### Name: rtrawl
### Title: Simulation of trawl process path using Slice partition. If using
###   customised trawl functions and primitives (i.e. 'trawl.function =
###   NA'), then, it is required that the user provides 'length(times) +
###   deep_cols' such functions and primitives where the 'deep_cols' first
###   one are used to reconstuct the first trawl value.
### Aliases: rtrawl

### ** Examples

alpha <- 5
beta <- 3
times <- 1:150
rho <- 0.2
trawl.function <- "exp"
margi <- "gamma"
kappa <- 0
n <- 1
rtrawl(alpha = alpha, beta = beta, kappa = kappa, times = times, n = 1,
marg.dist = margi, rho = rho, trawl.function = trawl.function)




