library(matchingMarkets)


### Name: stabit
### Title: Matching model and selection correction for group formation
### Aliases: stabit
### Keywords: regression

### ** Examples

## Not run: 
##D ## --- SIMULATED EXAMPLE ---
##D 
##D ## 1. Simulate one-sided matching data for 200 markets (m=200) with 2 groups
##D ##    per market (gpm=2) and 5 individuals per group (ind=5). True parameters 
##D ##    in selection equation is wst=1, in outcome equation wst=0. 
##D 
##D ## 1-a. Simulate individual-level, independent variables
##D  idata <- stabsim(m=200, ind=5, seed=123, gpm=2)
##D  head(idata)
##D  
##D ## 1-b. Simulate group-level variables 
##D  mdata <- stabit(x=idata, simulation="NTU", method="model.frame",
##D  selection = list(add="wst"), outcome = list(add="wst"), verbose=FALSE)
##D  head(mdata$OUT)
##D  head(mdata$SEL)
##D 
##D 
##D ## 2. Bias from sorting
##D 
##D ## 2-a. Naive OLS estimation
##D  lm(R ~ wst.add, data=mdata$OUT)$coefficients
##D 
##D ## 2-b. epsilon is correlated with independent variables
##D  with(mdata$OUT, cor(epsilon, wst.add))
##D  
##D ## 2-c. but xi is uncorrelated with independent variables
##D  with(mdata$OUT, cor(xi, wst.add))
##D 
##D ## 3. Correction of sorting bias when valuations V are observed
##D 
##D ## 3-a. 1st stage: obtain fitted value for eta
##D lm.sel <- lm(V ~ -1 + wst.add, data=mdata$SEL)
##D lm.sel$coefficients
##D 
##D eta <- lm.sel$resid[mdata$SEL$D==1]
##D 
##D ## 3-b. 2nd stage: control for eta
##D  lm(R ~ wst.add + eta, data=mdata$OUT)$coefficients
##D 
##D 
##D ## 4. Run Gibbs sampler
##D  fit1 <- stabit(x=idata, method="NTU", simulation="NTU", censored=1, 
##D                 selection = list(add="wst"), outcome = list(add="wst"), 
##D                 niter=2000, verbose=FALSE)
##D 
##D 
##D ## 5. Coefficient table
##D  summary(fit1)
##D 
##D 
##D ## 6. Plot MCMC draws for coefficients
##D  plot(fit1)
##D 
##D ## --- REPLICATION, Klein (2015a) ---
##D 
##D ## 1. Load data 
##D  data(baac00); head(baac00)
##D  
##D ## 2. Run Gibbs sampler
##D  klein15a <- stabit(x=baac00, selection = list(inv="pi",ieq="wst"), 
##D         outcome = list(add="pi",inv="pi",ieq="wst",
##D         add=c("loan_size","loan_size2","lngroup_agei")), offsetOut=1,
##D         method="NTU", binary=TRUE, gPrior=TRUE, marketFE=TRUE, niter=800000)
##D 
##D ## 3. Marginal effects
##D  summary(klein15a, mfx=TRUE)
##D  
##D ## 4. Plot MCMC draws for coefficients
##D  plot(klein15a)
## End(Not run)



