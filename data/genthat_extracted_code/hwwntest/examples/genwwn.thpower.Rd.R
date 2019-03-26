library(hwwntest)


### Name: genwwn.thpower
### Title: Compute (approximation) to the theoretical power of the
###   'genwwn.test' test for ARMA processes (including, of course, white
###   noise itself).
### Aliases: genwwn.thpower
### Keywords: htest ts

### ** Examples

#
# Calculate what the theoretical actual size is likely to be for the
# genwwn.test for a white noise sequence of T=64, nominal size=0.05
#
genwwn.thpower(N=64)$th.power
#[1] 0.04894124
#
# This is pretty close to the nominal size of 5%. Good.
#
# What is the power of detection for the AR(1) process with alpha=0.3?
# Let's say with sample size of T=32
#
genwwn.thpower(N=32, ar=0.3)$th.power 
#[1] 0.2294128
#
# That's pretty poor, we'll only detect about 23% of cases. Can we achieve
# a power of 90%? Actually, it turns out that by repeating these above
# functions with N=128 gives a power of 61%, and for N=256 we get a power of
# 90%. 



