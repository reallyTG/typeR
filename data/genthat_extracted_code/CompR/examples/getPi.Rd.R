library(CompR)


### Name: getPi
### Title: Gets the Bradley's scores.
### Aliases: getPi

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Pi<-getPi(ResCock)



