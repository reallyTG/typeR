library(RND)


### Name: extract.mln.density
### Title: Extract Mixture of Lognormal Densities
### Aliases: extract.mln.density

### ** Examples


#
# Create some calls and puts based on mln and 
# see if we can extract the correct values.
#


r         = 0.05
y         = 0.02
te        = 60/365
meanlog.1 = 6.8
meanlog.2 = 6.95
sdlog.1   = 0.065
sdlog.2   = 0.055
alpha.1   = 0.4


call.strikes = seq(from = 800, to = 1200, by = 10)
market.calls = price.mln.option(r = r, y = y, te = te, k = call.strikes, 
               alpha.1 = alpha.1, meanlog.1 = meanlog.1, meanlog.2 = meanlog.2, 
                                sdlog.1 = sdlog.1, sdlog.2 = sdlog.2)$call

s0 = price.mln.option(r = r, y = y, te = te, k = call.strikes, alpha.1 = alpha.1, 
                      meanlog.1 = meanlog.1, meanlog.2 = meanlog.2, 
                      sdlog.1 = sdlog.1, sdlog.2 = sdlog.2)$s0
s0
put.strikes  = seq(from = 805, to = 1200, by = 10)
market.puts  = price.mln.option(r = r, y = y, te = te, k = put.strikes, 
                                alpha.1 = alpha.1, meanlog.1 = meanlog.1, 
                                meanlog.2 = meanlog.2, sdlog.1 = sdlog.1, 
                                sdlog.2 = sdlog.2)$put

###
### The extracted values should be close to the actual values.
###

extract.mln.density(r = r, y = y, te = te, s0 = s0, market.calls = market.calls, 
               call.strikes = call.strikes, market.puts = market.puts, 
               put.strikes = put.strikes, lambda = 1, hessian.flag = FALSE)





