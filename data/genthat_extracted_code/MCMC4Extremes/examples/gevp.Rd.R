library(MCMC4Extremes)


### Name: gevp
### Title: Posterior Distribution with Parameters of GEV
### Aliases: gevp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
x=rgev(300,xi=0.1,mu=10,sigma=5)

# Obtaning 600 points of posterior distribution
ajuste=gevp(x,1,200)

# Obtaining 300 points of ponterior distribution of river nidd data
## Not run: data(nidd.annual)
## Not run: out=gevp(nidd.annual,1,300)

# Vector of maxima return for each 15 days for ibovespa data
## Not run: data(ibovespa)
## Not run: postibv=gevp(ibovespa[,4],15,300)
## Not run: plot.ts(postibv$posterior)



