library(BayesVarSel)


### Name: GibbsBvs
### Title: Bayesian Variable Selection for linear regression models using
###   Gibbs sampling.
### Aliases: GibbsBvs
### Keywords: package

### ** Examples


## Not run: 
##D #Analysis of Ozone35 data
##D 
##D data(Ozone35)
##D 
##D #We use here the (Zellner) g-prior for
##D #regression parameters and constant prior
##D #over the model space
##D #In this Gibbs sampling scheme, we perform 10100 iterations,
##D #of which the first 100 are discharged (burnin) and of the remaining
##D #only one each 10 is kept.
##D #as initial model we use the Full model
##D Oz35.GibbsBvs<- GibbsBvs(formula= y ~ ., data=Ozone35, prior.betas="gZellner",
##D prior.models="Constant", n.iter=10000, init.model="Full", n.burnin=100,
##D time.test = FALSE)
##D 
##D #Note: this is a heuristic approach and results are estimates
##D #of the exact answer.
##D 
##D #with the print we can see which is the most probable model
##D #among the visited
##D Oz35.GibbsBvs
##D 
##D #The estimation of inclusion probabilities and
##D #the model-averaged estimation of parameters:
##D summary(Oz35.GibbsBvs)
##D 
##D #Plots:
##D plot(Oz35.GibbsBvs, option="conditional")
## End(Not run)




