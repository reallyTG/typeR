library(sievetest)


### Name: std
### Title: Sieve Test Data Object
### Aliases: std is.std [.std
### Keywords: utilities

### ** Examples

## create std
sieve_aperture_size <- c(500, 200, 90, 0)
mass_ppc_retained <- c(1.01, 24, 42.8, 32.190)
# some meta data:
md <- desc.std("Coal powder, learning std")
# sieve test data (std) object
my_sample <- std(a=sieve_aperture_size, r=mass_ppc_retained, desc=md)
is.std(my_sample)



