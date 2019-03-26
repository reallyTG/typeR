library(ecolottery)


### Name: plot_comm
### Title: Regional vs. Local trait distributions of abundances
### Aliases: plot_comm
### Keywords: trait distribution species abundances regional pool local
###   community

### ** Examples

# Simulation of a neutral community including 100 individuals
J <- 500; theta <- 50; m <- 0.1;
comm1 <- coalesc(J, m, theta) 
plot_comm(comm1)
plot_comm(comm1, type = "abund")

# Stabilizing habitat filtering around t = 0.5
comm2 <- coalesc(J, m, theta, filt = function(x) 0.5 - abs(0.5 - x))
plot_comm(comm2)
plot_comm(comm2, type = "abund")



