library(ecolottery)


### Name: ecolottery-package
### Title: Coalescent-Based Simulation of Ecological Communities
### Aliases: ecolottery-package ecolottery
### Keywords: package

### ** Examples

## Coalescent-based simulation of stabilizing habitat filtering around 
## t = 0.5
J <- 100; theta <- 50; m <- 0.5;
comm <- coalesc(J, m, theta, filt = function(x) 0.5 - abs(0.5 - x))
plot_comm(comm)

## Forward-in-time simulation of stabilizing habitat filtering around 
## t = 0.5, over 100 time steps

# A regional pool including 100 species each including 10 individuals
pool <- sort(rep(as.character(1:100), 10))

# Initial community composed of 10 species each including 10 individuals, 
# with trait information for niche-based dynamics
initial <- data.frame(sp = sort(rep(as.character(1:10), 10)),
                      trait = runif(100))
final <- forward(initial = initial, prob = 0.5, gens = 100, pool = pool,
                 filt = function(x) 0.5 - abs(0.5 - x))
plot_comm(final)



