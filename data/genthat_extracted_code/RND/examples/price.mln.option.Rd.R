library(RND)


### Name: price.mln.option
### Title: Price Options on Mixture of Lognormals
### Aliases: price.mln.option

### ** Examples

#
# Try out a range of options
#

r  = 0.05
te = 60/365
k  = 700:1300
y  = 0.02
meanlog.1 = 6.80
meanlog.2 = 6.95
sdlog.1   = 0.065
sdlog.2   = 0.055
alpha.1   = 0.4


mln.prices = price.mln.option(r = r, y = y, te = te, k = k, alpha.1 = alpha.1, 
  meanlog.1 = meanlog.1, meanlog.2 = meanlog.2, sdlog.1 = sdlog.1, sdlog.2 = sdlog.2)

par(mfrow=c(1,2))
plot(mln.prices$call ~ k)
plot(mln.prices$put  ~ k)
par(mfrow=c(1,1))




