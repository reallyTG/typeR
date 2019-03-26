library(OptionPricing)


### Name: AsianCall
### Title: Calculates the Price, Delta and Gamma of an Asian Option
### Aliases: AsianCall

### ** Examples

# standard settings for an efficient simulation using QMC and variance reduction
AsianCall(T=1,d=12,K=100,r=0.05,sigma=0.2,S0=100,method="best",
  sampling="QMC",metpar=list(maxiter=100,tol=1.e-14,cvmethod="splitting"),
  sampar=list(nout=50,n=2039,a=1487,baker=TRUE,genmethod="pca"))
					   
# efficient Monte Carlo version of the above simulation
AsianCall(T=1,d=12,K=100,r=0.05,sigma=0.2,S0=100,method="best",
  sampling="MC",metpar=list(maxiter=100,tol=1.e-14,np=1000),
  sampar=list(n=10^5))

# simple QMC version without variance reduction

AsianCall(T=1,d=12,K=100,r=0.05,sigma=0.2,S0=100,method="naive",
  sampling="QMC",
  sampar=list(nout=50,n=2039,a=1487,baker=TRUE,genmethod="pca"))
					  
# naive Monte Carlo version
AsianCall(T=1,d=12,K=100,r=0.05,sigma=0.2,S0=100,method="naive",
  sampling="MC",sampar=list(n=10^5))

					  




