library(trawl)


### Name: fit_supIGtrawl
### Title: Fits a supIG trawl function to equidistant univariate time
###   series data
### Aliases: fit_supIGtrawl

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the supIG trawl function
set.seed(1)
t <- 1000
Delta <- 1
v <- 250
delta <- 0.5
gamma <- 1
#Simulate a univariate trawl process with supIG trawl function and
#Poisson marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl
="supIG",v=v, delta=delta,gamma=gamma)
#Fit the supIG trawl function to the simulated data
fittrawlfct <- fit_supIGtrawl(trawl,Delta, plotacf=TRUE,lags=500)
#Print the results
print(paste("delta: estimated:", fittrawlfct$delta, ", theoretical:", delta))
print(paste("gamma: estimated:", fittrawlfct$gamma, ", theoretical:", gamma))
## End(No test)



