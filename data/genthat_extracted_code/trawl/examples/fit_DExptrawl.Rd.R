library(trawl)


### Name: fit_DExptrawl
### Title: Fits the trawl function consisting of the weighted sum of two
###   exponential functions
### Aliases: fit_DExptrawl

### ** Examples

## No test: 
#Simulate a univariate trawl process and fit the double exponential trawl
#function
set.seed(1)
t <- 1000
Delta <- 1
v <- 250
w <- 0.1
lambda1 <- 0.1
lambda2 <- 1
#Simulate a univariate trawl process with double exponential trawl function
#and Poisson marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl
="DExp",v=v, w=w,lambda1=lambda1,lambda2=lambda2)
#Fit the double exponential trawl function to the simulated data
fittrawlfct <- fit_DExptrawl(trawl,Delta, plotacf=TRUE,lags=500)
#Print the results
print(paste("w: estimated:", fittrawlfct$w, ", theoretical:", w))
print(paste("lambda1: estimated:", fittrawlfct$lambda1, ", theoretical:",
lambda1))
print(paste("lambda2: estimated:", fittrawlfct$lambda2, ", theoretical:",
lambda2))
## End(No test)



