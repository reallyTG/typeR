library(RND)


### Name: get.point.estimate
### Title: Point Estimation of the Density
### Aliases: get.point.estimate

### ** Examples


###
### Recover the lognormal density based on BSM
###

r     = 0.05
te    = 60/365
s0    = 1000
k     = seq(from = 500, to = 1500, by = 1)
sigma = 0.25
y     = 0.01


bsm.calls = price.bsm.option(r =r, te = te, s0 = s0, k = k, sigma = sigma, y = y)$call
density.est = get.point.estimate(market.calls = bsm.calls, 
              call.strikes = k, r = r , te = te)

len = length(k)-1
### Note, estimates at two data points (smallest and largest strikes) are lost
plot(density.est ~ k[2:len], type = "l")  




