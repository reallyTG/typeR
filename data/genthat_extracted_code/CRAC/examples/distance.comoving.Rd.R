library(CRAC)


### Name: distance.comoving
### Title: compute the comoving distance (line-of-sight) [Mpc/h]
### Aliases: distance.comoving

### ** Examples

distance.comoving(0.2,parameter.fidcosmo,z0=0.3)
sapply(seq(0,1,0.1),function (x) distance.comoving(x,parameter.fidcosmo))



