library(BayesVarSel)


### Name: histBMA
### Title: A function for histograms-like representations of objects of
###   class 'bma.coeffs'
### Aliases: histBMA

### ** Examples



## Not run: 
##D 
##D #Analysis of Crime Data
##D #load data
##D data(UScrime)
##D 
##D crime.Bvs<- Bvs(formula= y ~ ., data=UScrime, n.keep=1000)
##D crime.Bvs.BMA<- BMAcoeff(crime.Bvs, n.sim=10000)
##D #the best 1000 models are used in the mixture
##D 
##D #Observe the bimodality of the coefficient associated with regressor M
##D histBMA(crime.Bvs.BMA, "M")
##D 
##D #Note 1:
##D #The value in top of the bar at zero (0.251 in this case) is the probability of beta_M is
##D #zero conditional on a model space containing the 1000 models used in the mixture. This value
##D #should be closed to the exact value
##D #1-crime.Bvs$inclprob["M"]
##D #which in this case is 0.2954968
##D #if n.keep above is close to 2^15
##D 
##D #Note 2:
##D #The BMA posterior distribution of beta_M has two modes approximately located at 0 and 10
##D #If we summarize this distribution using the mean
##D mean(crime.Bvs.BMA[ ,"M"])
##D #or median
##D median(crime.Bvs.BMA[ ,"M"])
##D #we obtain values around 7 (or 7.6) which do not represent this distribution.
##D 
##D #With the Gibbs algorithms:
##D data(Ozone35)
##D 
##D Oz35.GibbsBvs<- GibbsBvs(formula="y~.", data=Ozone35, prior.betas="gZellner",
##D prior.models="Constant", n.iter=10000, init.model="Full", n.burnin=100,
##D time.test = FALSE)
##D Oz35.GibbsBvs.BMA<- BMAcoeff(Oz35.GibbsBvs, n.sim=10000)
##D 
##D histBMA(Oz35.GibbsBvs.BMA, "x6.x7")
##D #In this case (Gibbs sampling), the value in top of the bar at zero (0.366)
##D #basically should coincide (if n.sim is large enough)
##D #with the estimated complement of the inclusion probability
##D #1-Oz35.GibbsBvs$inclprob["x6.x7"]
##D #which in this case is 0.3638
## End(Not run)




