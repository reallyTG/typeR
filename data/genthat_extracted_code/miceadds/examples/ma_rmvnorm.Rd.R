library(miceadds)


### Name: ma_rmvnorm
### Title: Simulating Normally Distributed Data
### Aliases: ma_rmvnorm

### ** Examples

#############################################################################
# EXAMPLE 1: Two-dimensional simulation with zero variance at dimension 1
#############################################################################

sigma <- matrix( c(0,0,0,1), nrow=2, ncol=2)
miceadds::ma_rmvnorm( n=10, sigma=sigma )



