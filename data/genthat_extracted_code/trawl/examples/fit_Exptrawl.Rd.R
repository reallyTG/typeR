library(trawl)


### Name: fit_Exptrawl
### Title: Fits an exponential trawl function to equidistant time series
###   data
### Aliases: fit_Exptrawl

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the exponential trawl function
set.seed(1)
t <- 1000
Delta <- 1
v <- 250
lambda <- 0.25
#Simulate a univariate trawl process with exponential trawl function and
#Poisson marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl
="Exp",v=v, lambda1=lambda)
#Fit the exponential trawl function to the simulated data
fittrawlfct <- fit_Exptrawl(trawl,Delta, plotacf=TRUE,lags=500)
#Print the results
print(paste("lambda: estimated:", fittrawlfct$lambda, ", theoretical:",
lambda))
## End(No test)



