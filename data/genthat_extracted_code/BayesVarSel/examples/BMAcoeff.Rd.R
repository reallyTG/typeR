library(BayesVarSel)


### Name: BMAcoeff
### Title: Bayesian Model Averaged estimations of regression coefficients
### Aliases: BMAcoeff

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
##D #We could force all  possible models to be included in the mixture
##D crime.Bvs.all<- Bvs(formula= y ~ ., data=UScrime, n.keep=2^15)
##D crime.Bvs.BMA<- BMAcoeff(crime.Bvs.all, n.sim=10000)
##D #(much slower as this implies ordering many more models...)
##D 
##D #With the Gibbs algorithms:
##D data(Ozone35)
##D 
##D Oz35.GibbsBvs<- GibbsBvs(formula= y ~ ., data=Ozone35, prior.betas="gZellner",
##D prior.models="Constant", n.iter=10000, init.model="Full", n.burnin=100,
##D time.test = FALSE)
##D Oz35.GibbsBvs.BMA<- BMAcoeff(Oz35.GibbsBvs, n.sim=10000)
##D 
##D 
## End(Not run)




