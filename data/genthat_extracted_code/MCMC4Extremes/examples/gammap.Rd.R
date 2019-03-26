library(MCMC4Extremes)


### Name: gammap
### Title: Posterior Distribution with Gamma Density
### Aliases: gammap

### ** Examples

# Vector of maxima return for each 10 days for ibovespa data
data(ibovespa)
ibmax=gev(ibovespa[,4],10)$data
# obtaining 500 points of posterior distribution 
ibovpost=gammap(ibmax,300)



