library(ecolottery)


### Name: coalesc
### Title: Coalescent-based simulation of ecological communities undergoing
###   both neutral and niche-base dynamics
### Aliases: coalesc
### Keywords: coalescent neutral dynamics niche-based dynamics

### ** Examples

# Simulation of a neutral community including 100 individuals
J <- 500; theta <- 50; m <- 0.1
comm1 <- coalesc(J, m, theta) 
# Regional and local trait distributions
plot_comm(comm1)
 
# Define a regional pool of species with equal abundances
pool <- cbind(1:10000, rep(1:500, 20), rep(NA, 10000))
# Uniform distribution of trait values
t.sp <- runif(500)
# No intraspecific variation
pool[,3] <- t.sp[pool[,2]]
# Generate a neutral community drawn from the pool
comm2<- coalesc(J, m, pool = pool) 
plot_comm(comm2)

# Directional habitat filtering toward t = 0
comm3 <- coalesc(J, m, filt = function(x) 1 - x, pool = pool)
# Regional and local trait distributions
plot_comm(comm3)

# Function for environmental filtering
sigma <- 0.1
filt_gaussian <- function(t, x) exp(-(x - t)^2/(2*sigma^2))

# Stabilizing habitat filtering around t = 0.1
comm4a <- coalesc(J, m, filt = function(x) filt_gaussian(0.1, x), pool = pool)
plot_comm(comm4a)
# Stabilizing habitat filtering around t = 0.5
comm4b <- coalesc(J, m, theta, filt = function(x) filt_gaussian(0.5, x),
                  pool = pool)
plot_comm(comm4b)
# Stabilizing habitat filtering around t = 0.9
comm4c <- coalesc(J, m, theta, filt = function(x) filt_gaussian(0.9, x),
                  pool = pool)
plot_comm(comm4c)

# Mean trait values in communities reflect the influence of habitat filtering
mean(comm4a$com[, 3])
mean(comm4b$com[, 3])
mean(comm4c$com[, 3])

# Disruptive habitat filtering around t = 0.5
comm5 <- coalesc(J, m, filt = function(x) abs(0.5 - x), pool = pool)
plot_comm(comm5)

# Multi-modal habitat filtering 
t.sp <- rnorm(500)
pool[, 3] <- t.sp[pool[,2]]
comm6 <- coalesc(J, m, filt = function(x) sin(3*x) + 1, pool = pool)
plot_comm(comm6)




