library(MCMC4Extremes)


### Name: gumbelp
### Title: Posterior Distribution with GEV, where xi=0
### Aliases: gumbelp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
x=rgev(200,xi=0.0001,mu=10,sigma=5)
# Obtaning 600 points of posterior distribution
ajuste=gumbelp(x,1,600)

# Maxima of each month in river nidd data
## Not run: data(nidd.annual)
## Not run: out=gumbelp(nidd.annual,1,500)

# Predictive distribution for 15 day maxima ibovespa returns
## Not run: data(ibovespa)
## Not run: postibv=gumbelp(ibovespa[,4],15,500)



