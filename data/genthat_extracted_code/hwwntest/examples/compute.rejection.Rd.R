library(hwwntest)


### Name: compute.rejection
### Title: Function to compute empirical size or power for various tests of
###   white noise.
### Aliases: compute.rejection
### Keywords: htest

### ** Examples

#
# Compute empirical size of both tests using 1000 realizations
# with data of length 32
#
answer <- compute.rejection(npow=100, ndata=32)
#
# Print the answer
#
print(answer)
#$hwwntest.rejprop
#[1] 0.03
#
#$box.rejprop
#[1] 0.02
#
#$bartlett.rejprop
#[1] 0.01
#
#$d00.pow
#[1] 0.03
#
#$genwwn.pow
#[1] 0.02
#
#$hywn.pow
#[1] 0.01
#
#$hywavwn.pow
#[1] 0.03
#
#
# So, all empirical sizes should be close to their nominal value of 0.05
#
# Now let's try and ascertain the empirical power on an AR(1)
#
answer <- compute.rejection(ar=0.8, npow=100, ndata=32)
#
# Print the answer
#
print(answer)
#$hwwntest.rejprop
#[1] 0.79
#
#$box.rejprop
#[1] 0.98
#
#$bartlett.rejprop
#[1] 0.97
#
#$d00.pow
#[1] 0.97
#
#$genwwn.pow
#[1] 0.94
#
#$hywn.pow
#[1] 0.95
#
#$hywavwn.pow
#[1] 0.85
#
# Most powers are pretty good. 



