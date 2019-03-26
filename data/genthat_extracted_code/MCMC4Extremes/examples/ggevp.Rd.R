library(MCMC4Extremes)


### Name: ggevp
### Title: Posterior Distribution with Parameters of Dual Gamma Generalized
###   Extreme Value Distribution
### Aliases: ggevp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
w=rggev(300,0.1,10,5,0.5)

# Obtaning 500 points of posterior distribution with delta=0.5
ajust=ggevp(w,1,200,0.5)



