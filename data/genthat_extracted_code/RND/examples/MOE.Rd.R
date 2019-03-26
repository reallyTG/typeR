library(RND)


### Name: MOE
### Title: Mother of All Extractions
### Aliases: MOE

### ** Examples


###
### You should see that all methods extract the same density!
###

r     = 0.05
te    = 60/365
s0    = 1000
sigma = 0.25
y     = 0.02

strikes     = seq(from = 500, to = 1500, by = 5)
bsm.prices  = price.bsm.option(r =r, te = te, s0 = s0, 
              k = strikes, sigma = sigma, y = y)

calls   = bsm.prices$call
puts    = bsm.prices$put

###
### See where your results will go...
###

getwd()


###
###  Running this may take 1-2 minutes...
###
### MOE(market.calls = calls, call.strikes = strikes, market.puts = puts, 
###    put.strikes = strikes, call.weights = 1, put.weights = 1, 
###    lambda = 1, s0 = s0, r = r, te = te, y = y, file.name = "myfile")
###
### You may get some warning messages.  This happens because the
###    automatic initial value selection sometimes picks values
###    that produce NaNs in the generalized beta density estimation.
###    These messages are often inconsequential.
###



