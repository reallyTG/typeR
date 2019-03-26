library(OptionPricing)


### Name: OptionPricing-package
### Title: Option Pricing and Greeks Estimation for Asian and European
###   Options
### Aliases: OptionPricing-package OptionPricing
### Keywords: package

### ** Examples

# standard settings for an efficient simulation using QMC and variance reduction
AsianCall(T=1,d=12,K=100,r=0.05,sigma=0.2,S0=100,method=c("best"),
  sampling=c("QMC"),metpar=list(maxiter=100,tol=1.e-14,cvmethod="splitting"),
  sampar=list(nout=50,n=2039,a=1487,baker=TRUE,genmethod="pca"))

# Calculation of the Price of an Asian option using a good approximation  
  AsianCall_AppLord(T = 1, d = 12, K = 100, r = 0.05, sigma = 0.2, S0 = 100)


# standard settings for an efficient simulation using MC and variance reduction
AsianCall(T=1,d=12,K=170,r=0.05,sigma=0.2,S0=100,method="best",
          sampling="MC",metpar=list(maxiter=100,tol=1.e-14,np=1000),
		  sampar=list(n=10^5))
# Calculation of the approximate price, a bit different to the above result 
  AsianCall_AppLord(T = 1, d = 12, K = 170, r = 0.05, sigma = 0.2, S0 = 100)
  
# Calculation of the Price of an Asian option using a good approximation  
  AsianCall_AppLord(T = 1, d = 12, K = 100, r = 0.05, sigma = 0.2, S0 = 100)

#Price, Delta and Gamma of European options using Black-Scholes  
BS_EC(K=100, r = 0.05, sigma = 0.2, T = 0.25, S0 = 100)
BS_EP(K=100, r = 0.05, sigma = 0.2, T = 0.25, S0 = 100)



