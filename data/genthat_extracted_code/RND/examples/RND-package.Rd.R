library(RND)


### Name: RND-package
### Title: Risk Neutral Density Extraction Package
### Aliases: RND-package RND
### Keywords: package Risk Neutral Density Options

### ** Examples


###
### You should see that all methods extract the same density!
###

r     = 0.05
te    = 60/365
s0    = 1000
sigma = 0.25
y     = 0.02

call.strikes.bsm   = seq(from = 500, to = 1500, by = 5)
market.calls.bsm   = price.bsm.option(r =r, te = te, s0 = s0, 
                     k = call.strikes.bsm, sigma = sigma, y = y)$call

put.strikes.bsm    = seq(from = 500, to = 1500, by = 5)
market.puts.bsm    = price.bsm.option(r =r, te = te, s0 = s0, 
                     k = put.strikes.bsm, sigma = sigma, y = y)$put

###
### See where your results will be outputted to...
###

getwd()


###
###  Running this may take a few minutes...
###
###  MOE(market.calls.bsm, call.strikes.bsm, market.puts.bsm, 
###  put.strikes.bsm, s0, r , te, y, "bsm2")
###



