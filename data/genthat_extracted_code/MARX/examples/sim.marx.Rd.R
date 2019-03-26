library(MARX)


### Name: sim.marx
### Title: The simulation of MARX processes
### Aliases: sim.marx
### Keywords: simulation

### ** Examples

dist.eps <- c('t',1,1) ## t-distributed errors with 1 degree of freedom and scale parameter 1
dist.x   <- c('normal',0,1) ## standard normally distributed x variable
obs <- 100
c_par <- c(0.2,0.4)
nc_par <- 0.8
exo_par <- 0.5
sim.marx(dist.eps,dist.x,obs,c_par,nc_par,exo_par) ## Simulates a MARX(2,1,1) process



