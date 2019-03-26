library(DDHFm)


### Name: DDHFm
### Title: Data-driven Haar-Fisz for microarrays
### Aliases: DDHFm
### Keywords: manip

### ** Examples

#
# First, let's make up some "true" intensities (these are gamma)
#
TrueInt <- genesimulator(nreps=5, nps=100)
#
# Now let us simulate data from the Durbin and Rocke (2001) model conditioning
# on the TrueInt
#
MAInts <- simdurbin2(TrueInt,alpha=24800, seta=0.227, seps=4800)
#
# Now put these intensities into the correct format for DDHFm. That is
# replicates across columns
#
MAm <- matrix(MAInts, ncol=5, byrow=TRUE)
#
# Apply DDHFm transform
#
MAmDDHFm <- DDHFm(MAm)
#
# Now look at the variances of each
#
diag(var(MAm))
#
#[1] 22443437 25065729 23430160 22470058 21023183
#
diag(var(MAm))/ mean(diag(var(MAm)))
#
#[1] 0.9806403 1.0952183 1.0237540 0.9818035 0.9185839
#
# Now for the DDHFm version
#
diag(var(MAmDDHFm))
#
# [1] 10938.71 11369.41 11169.50 11144.74 10959.94
#
diag(var(MAmDDHFm))/ mean(diag(var(MAmDDHFm)))
#
# [1] 0.9840099 1.0227549 1.0047711 1.0025441 0.9859200
#
# So stabilization is better with DDHFm 
#



