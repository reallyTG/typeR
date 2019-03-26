library(CompR)


### Name: getRestestprod
### Title: Gets the result of the Bradley's scores multiple comparison
###   tests.
### Aliases: getRestestprod

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Restestprod<-getRestestprod(ResCock)



