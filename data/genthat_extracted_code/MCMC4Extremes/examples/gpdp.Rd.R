library(MCMC4Extremes)


### Name: gpdp
### Title: Posterior Distribution with Parameters of GPD
### Aliases: gpdp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points 
x=rgpd(300,xi=0.1,mu=9,beta=2) # in this case beta is the scale parameter sigma

# Obtaning 1000 points of posterior distribution
ajuste=gpdp(x,9, 200)

# Histogram of posterior distribution of the parameters,with 95% credibility intervals
# Danish data for evir package, modelling losses over 10
## Not run data(danish)
## Not run out=gpdp(danish,10,300)



