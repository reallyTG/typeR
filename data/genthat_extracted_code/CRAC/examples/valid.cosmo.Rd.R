library(CRAC)


### Name: valid.cosmo
### Title: validate the cosmologial parameters are enough
### Aliases: valid.cosmo

### ** Examples

# there are two typos in the cosmology parameter list
a <- list(omegaM=0.272,omegaL0=0.728,omegaK=0.0,h0=0.704)
valid.cosmo(a)
print(a)



