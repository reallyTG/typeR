library(RND)


### Name: mln.objective
### Title: Objective function for the Mixture of Lognormal
### Aliases: mln.objective

### ** Examples

#
# The mln objective function should be close to zero.
# The weights are automatically set to 1.
#

r  = 0.05
te = 60/365
y  = 0.02
   
meanlog.1 = 6.8
meanlog.2 = 6.95
sdlog.1   = 0.065
sdlog.2   = 0.055
alpha.1   = 0.4

# This is the current price implied by parameter values:
s0 = 981.8815 

call.strikes = seq(from = 800, to = 1200, by = 10)
market.calls = price.mln.option(r=r, y = y, te = te, k = call.strikes, 
               alpha.1 = alpha.1, meanlog.1 = meanlog.1, meanlog.2 = meanlog.2, 
               sdlog.1 = sdlog.1, sdlog.2 = sdlog.2)$call

put.strikes  = seq(from = 805, to = 1200, by = 10)
market.puts  = price.mln.option(r = r, y = y, te = te, k = put.strikes, 
               alpha.1 = alpha.1, meanlog.1 = meanlog.1, meanlog.2 = meanlog.2, 
               sdlog.1 = sdlog.1, sdlog.2 = sdlog.2)$put

mln.objective(theta=c(alpha.1,meanlog.1, meanlog.2 , sdlog.1, sdlog.2), 
               r = r, y = y, te = te, s0 = s0, 
               market.calls = market.calls, call.strikes = call.strikes, 
               market.puts = market.puts, put.strikes = put.strikes, lambda = 1)



