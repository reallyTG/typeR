library(CompR)


### Name: getRestestglob
### Title: Gets the result of the test of Bradley's scores equality.
### Aliases: getRestestglob

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Restestglob<-getRestestglob(ResCock)



