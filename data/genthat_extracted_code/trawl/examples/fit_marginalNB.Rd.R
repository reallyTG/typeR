library(trawl)


### Name: fit_marginalNB
### Title: Fist a negative binomial distribution as marginal law
### Aliases: fit_marginalNB

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the exponential trawl function
#and the marginal negative binomial law
set.seed(1)
t <- 1000
Delta <- 1
m<-200
theta<-0.5
lambda <- 0.25
#Simulate a univariate trawl process with exponential trawl function and
#negative binomial marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("NegBin"),trawl
="Exp",m=m, theta=theta, lambda1=lambda)
#Fit the exponential trawl function to the simulated data
fittrawlfct <- fit_Exptrawl(trawl,Delta, plotacf=TRUE,lags=500)
#Fit the Poisson marginal law
fitmarginallaw <- fit_marginalNB(trawl, fittrawlfct$LM, plotdiag=TRUE)
#Print the results
print(paste("lambda: estimated:", fittrawlfct$lambda, ", theoretical:",
lambda))
print(paste("m: estimated:", fitmarginallaw$m, ", theoretical:", m))
print(paste("theta: estimated:", fitmarginallaw$theta, ", theoretical:",
theta))
## End(No test)



