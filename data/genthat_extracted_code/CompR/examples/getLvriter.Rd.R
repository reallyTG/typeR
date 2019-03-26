library(CompR)


### Name: getLvriter
### Title: Gets the iteration done until convergence of the loglikelihood
###   estimation of Bradley's scores.
### Aliases: getLvriter

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Lvriter<-getLvriter(ResCock)



