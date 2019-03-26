library(trawl)


### Name: fit_LMtrawl
### Title: Fits a long memory trawl function to equidistant univariate time
###   series data
### Aliases: fit_LMtrawl

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the long memory trawl function
set.seed(1)
t <- 1000
Delta <- 1
v <- 250
alpha <- 0.01
H <- 1.3
#Simulate a univariate trawl process with LM trawl function and Poisson
#marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl
="LM",v=v, alpha=alpha, H=H)
#Fit the LM trawl function to the simulated data
fittrawlfct <- fit_LMtrawl(trawl,Delta, plotacf=TRUE,lags=500)
#Print the results
print(paste("alpha: estimated:", fittrawlfct$alpha, ", theoretical:", alpha))
print(paste("H: estimated:", fittrawlfct$H, ", theoretical:", H))
## End(No test)



