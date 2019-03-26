library(blink)


### Name: mpmms
### Title: Function to compute a record's MPMMS based on a Gibbs sampler.
###   Note: It returns a list of the MPMMS ($mpmms) and its probability
###   ($prob)
### Aliases: mpmms

### ** Examples

lam.gs <- matrix(c(1,1,2,2,3,3,5,6,4,3,4,5,3,2,4,1,2,3,4,2),ncol=20,  nrow=4)
record <- c(1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3)
mpmms(lam.gs=lam.gs, record=record)



