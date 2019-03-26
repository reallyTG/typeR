library(RND)


### Name: price.bsm.option
### Title: Price BSM Option
### Aliases: price.bsm.option

### ** Examples

#
# call should be 4.76, put should be 0.81, from Hull 8th, page 315, 316
#

r     = 0.10
te    = 0.50
s0    = 42
k     = 40
sigma = 0.20
y     = 0

bsm.option = price.bsm.option(r =r, te = te, s0 = s0, k = k, sigma = sigma, y = y)
bsm.option

#
# Make sure put-call parity holds, Hull 8th, page 351
#

(bsm.option$call - bsm.option$put) - (s0 * exp(-y*te) - k * exp(-r*te))




