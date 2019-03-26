library(hkevp)


### Name: hkevp.rand
### Title: Simulation of the HKEVP
### Aliases: hkevp.rand

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:3,1:3))
loc <- sites[,1]*10
scale <- 3
shape <- 0
alpha <- .4
tau <- 1
ysim <- hkevp.rand(10, sites, sites, loc, scale, shape, alpha, tau)








