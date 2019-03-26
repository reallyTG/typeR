library(trawl)


### Name: fit_marginalPoisson
### Title: Fits a Poisson distribution as marginal law
### Aliases: fit_marginalPoisson

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the exponential trawl function
#and the marginal Poisson law
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
#Fit the Poisson marginal law
fitmarginallaw <- fit_marginalPoisson(trawl, fittrawlfct$LM, plotdiag=TRUE)
#Print the results
print(paste("lambda: estimated:", fittrawlfct$lambda, ", theoretical:",
lambda))
print(paste("v: estimated:", fitmarginallaw$v, ", theoretical:", v))
## End(No test)



