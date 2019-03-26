library(CompR)


### Name: getVarcov
### Title: Gets the Bradley'scores covariance matrices.
### Aliases: getVarcov

### ** Examples

data(Cocktail)
ResCock<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
ResCock_Varcov<-getVarcov(ResCock)



