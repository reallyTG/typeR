library(CompR)


### Name: EstimBradley
### Title: Estimation of Bradley's scores in the different classes of
###   subjects
### Aliases: EstimBradley

### ** Examples

data(Cocktail)
show(Cocktail)
ResCock1<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=0.001,eps1=0.001,TestPi=TRUE)
show(ResCock1)



