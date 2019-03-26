library(RND)


### Name: price.shimko.option
### Title: Price Option based on Shimko's Method
### Aliases: price.shimko.option

### ** Examples


r       =  0.05
y       =  0.02
te      =  60/365
s0      =  1000
k       =  950
sigma   =  0.25
a0      =  0.30
a1      =  -0.00387
a2      =  0.00000445

#
#  Note how Shimko price is the same when a0 = sigma, a1=a2=0 but substantially 
#  more when a0, a1, a2 are changed so the implied volatilies are very high!
#

price.bsm.option(r = r, te = te, s0 = s0, k = k, sigma = sigma, y = y)$call
price.shimko.option(r = r, te = te, s0 = s0, k = k, y = y, 
                    a0 = sigma, a1 = 0, a2 = 0)$call
price.shimko.option(r = r, te = te, s0 = s0, k = k, y = y, 
                    a0 = a0, a1 = a1, a2 = a2)$call



