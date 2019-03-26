library(dad)


### Name: distl2dpar
### Title: L^2 distance between Gaussian densities given their parameters
### Aliases: distl2dpar dist.l2d.gp dist.l2d.gp.u

### ** Examples

u1 <- c(1,1,1);
v1 <- matrix(c(4,0,0,0,16,0,0,0,25),ncol = 3);
u2 <- c(0,1,0);
v2 <- matrix(c(1,0,0,0,1,0,0,0,1),ncol = 3);
distl2dpar(u1,v1,u2,v2)



