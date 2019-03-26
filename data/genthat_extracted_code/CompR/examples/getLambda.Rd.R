library(CompR)


### Name: getLambda
### Title: Gets the weight of the different classes.
### Aliases: getLambda

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Lambda<-getLambda(ResCock)



