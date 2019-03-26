library(wavethresh)


### Name: conbar
### Title: Performs inverse DWT reconstruction step
### Aliases: conbar
### Keywords: math

### ** Examples

#
# Let's generate some test data, just some 32 normal variates.
#
v <- rnorm(32)
#
# Now take the wavelet transform with default filter arguments (which
# are filter.number=10, family="DaubLeAsymm")
#
vwd <- wd(v)
#
# Now, let's take an arbitrary level, say 2, and reconstruct level 3
# scaling function coefficients
#
c.in <- accessC(vwd, lev=2)
d.in <- accessD(vwd, lev=2)
#
conbar(c.in, d.in, filter.select(filter.number=10, family="DaubLeAsymm"))
#[1] -0.50368115  0.04738620 -0.90331807  1.08497622  0.90490528  0.06252717
#[7]  2.55894899 -1.26067508
#
# Ok, this was the pure reconstruction from using only level 2 information.
#
# Let's check this against the "original" level 3 coefficients (which get
# stored on the decomposition step in wd)
#
accessC(vwd, lev=3)
#[1] -0.50368115  0.04738620 -0.90331807  1.08497622  0.90490528  0.06252717
#[7]  2.55894899 -1.26067508
#
# Yep, the same numbers!
#



