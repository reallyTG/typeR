library(wavethresh)


### Name: dof
### Title: Compute number of non-zero coefficients in wd object
### Aliases: dof
### Keywords: models

### ** Examples

#
# Let's generate some purely random numbers!!
#
myrandom <- rnorm(512)
#
# Take the discrete wavelet transform
#
myrandomWD <- wd(myrandom)
#
# How many coefficients are non-zero?
#
dof(myrandomWD)
# [1] 512
#
# All of them were nonzero!
#
# Threshold it
#
myrandomWDT <- threshold(myrandomWD, policy="universal")
#
# Now lets see how many are nonzero
#
dof(myrandomWDT)
# [1] 8
#
# Wow so 504 of the coefficients were set to zero! Spooky!
#



